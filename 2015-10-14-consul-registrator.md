---
title: Docker konténerek linkelése II, Consul és Registrator
layout: post
author: elek
type: dpc
tags:
  - consul
  - registrator
---

Az [előző][1] postban láttuk, hogy alapszinten hogyan lehet összelinkelgetni a konténereinket csupán a docker fapados eszközeit használva. De vannak persze minderre már kicsit komolyabb eszközök is.

## Service Registry, Consul

Ha már annyi konténerünk van, hogy egyre nehezebb számon tartani őket logikusan hangzik, hogy indítsunk el egy kockás füzetet, amibe majd mindent szépen felírunk, hogy mi hol van. Hívjuk a füzetet _service registry_-nek és valósítsuk meg a [consul](http://consul.io) alkalmazással.

A consul egy változatos módokon clusterezhető service registry. Amellett hogy viszonylag okosan skálázódik, megszólítható DNS-en keresztül is (a HTTP API + interface mellett) valamint van benne _health check_: az agent úgy tudja a service-t regisztrálni, hogy folyamatosan figyeli, hogy mikor kell a regisztrációt visszavonni.

Ezek közül a DNS API az egyik legszórakoztatóbb játék. Ha egy service-t beregisztrálunk, akkor nem kell vesződni azzal, hogy aki használni akarja hogy fogja megtalálni, elég ha beírjuk a consul instance-t is DNS szervernek. Pl. ha volt egy _valami_ service-ünk, akkor:

```
 > dig @localhost valami.service.dc1.consul

; <<>> DiG 9.10.3 <<>> @localhost valami.service.dc1.consul
; (2 servers found)
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 54249
;; flags: qr aa rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 0

;; QUESTION SECTION:
;valami.service.dc1.consul.	IN	A

;; ANSWER SECTION:
valami.service.dc1.consul. 0	IN	A	172.17.0.3

;; Query time: 1 msec
;; SERVER: ::1#53(::1)
;; WHEN: Wed Oct 21 15:22:45 CEST 2015
;; MSG SIZE  rcvd: 84
```

Persze portokkal már nem ilyen egyszerű a játék, bár az is elérhető SRV rekordok formájában, de ott lehet hogy már egyszerűbb a HTTP API-t használni.

## Registrator

Ahhoz hogy a docker konténereink regisztrálva legyenek a consulban, minden konténerben kéne futnia egy agentnek. Ezt nyilván valóan nem szeretnénk. Szerencsére van a [registrator][registrator] nevű projekt, ami azt csinálja, hogy feliratkozik az összes docker eseményre, és ha van valami a dockerben akkor annak megfelelően frissíti a consul-t (vagy az etcd-t vagy a skydns-t).

## Docker

A docker konténerek környékén több információra is kiváncsiak vagyunk:

 1. Mi a docker konténer belső dockeres IP címe.
 2. Mi a docker0 interface IP címe a hoston (láttuk hogy ez nagyon jól jön helyi linkelés esetén)
 3. Mi a host külső IP címe (ha esetleg több hoston futtatnák docker-t, akkor jól jöhet)
 4. Mik a belső port kiosztások (hagyományos linkelésnél ez számít)
 5. Mik a host gépre kiforwardolt portok (ha valaki más gépről akarná a service-t megkeresni)

Alapvetően két esettel számolunk (illetve akár többel is, de azt majd a végén fogjuk látni):

 1. Ha csak egy gépünk van, akkor elvileg elég lehet tudni a belső IP-ket (1) és belső portokat (2).
 2. Ha több gépen vannak a konténerek, akkor már valószínű a host IP (3) és a forwardolt portok (5) érdekelnek.

A registrator elvileg mindkettőt tudja. 

## Egy gép

Indítsunk egy consul-t:

```
sudo docker run -d -p 8400:8400 -p 8500:8500 -p 53:53/udp -h node1 progrium/consul -server -bootstrap -ui-dir /ui
```

Innen már megnézhetjük a webes interface-t is: http://localhost:8500

Indítsuk el a registrator-t ```-internal``` kapcsolóval:

```
sudo docker run -d  --name=registrator --volume=/var/run/docker.sock:/tmp/docker.sock gliderlabs/registrator:latest -internal consul://10.186.150.172:8500 
```

Indítsunk el egy példa service-t:

```
sudo docker run -e SERVICE_NAME=valami --name web5 --label type=frontend -p 7679:80 -d test
```

Majd ellenőrizzük a registert:

```
curl -v http://localhost:8500/v1/catalog/service/valami | jq
[
  {
    "Node": "node1",
    "Address": "172.17.0.1",
    "ServiceID": "56290e6d259f:web7:80",
    "ServiceName": "valami",
    "ServiceTags": null,
    "ServiceAddress": "172.17.0.3",
    "ServicePort": 80
  },
  {
    "Node": "node1",
    "Address": "172.17.0.1",
    "ServiceID": "56290e6d259f:web7:443",
    "ServiceName": "valami",
    "ServiceTags": null,
    "ServiceAddress": "172.17.0.3",
    "ServicePort": 443
  }
]
```


Vagy akár DNS-en keresztül

```
 > dig @localhost valami.service.dc1.consul

; <<>> DiG 9.10.3 <<>> @localhost valami.service.dc1.consul
; (2 servers found)
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 54249
;; flags: qr aa rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 0

;; QUESTION SECTION:
;valami.service.dc1.consul.	IN	A

;; ANSWER SECTION:
valami.service.dc1.consul. 0	IN	A	172.17.0.3

;; Query time: 1 msec
;; SERVER: ::1#53(::1)
;; WHEN: Wed Oct 21 15:22:45 CEST 2015
;; MSG SIZE  rcvd: 84
```

## Több gép

A második esetben a registrátornál az ```-internal``` kapcsoló helyett segítsünk megtalálni a külső interface-ünk IP-jét:

```
sudo docker run -d  --name=registrator --volume=/var/run/docker.sock:/tmp/docker.sock gliderlabs/registrator:latest -ip=10.186.150.172 consul://10.186.150.172:8500 
```

Ekkor az eredmény:

```
 > curl -v http://localhost:8500/v1/catalog/service/valami | jq
[
  {
    "Node": "node1",
    "Address": "172.17.0.4",
    "ServiceID": "0bbcbb14882c:web7:80",
    "ServiceName": "valami",
    "ServiceTags": null,
    "ServiceAddress": "10.186.150.172",
    "ServicePort": 7680
  }
]

```

Vagy:

```
 > dig @localhost valami.service.dc1.consul

; <<>> DiG 9.10.3 <<>> @localhost valami.service.dc1.consul
; (2 servers found)
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 17600
;; flags: qr aa rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 0

;; QUESTION SECTION:
;valami.service.dc1.consul.	IN	A

;; ANSWER SECTION:
valami.service.dc1.consul. 0	IN	A	10.186.150.172

;; Query time: 1 msec
;; SERVER: ::1#53(::1)
;; WHEN: Wed Oct 21 15:42:22 CEST 2015
;; MSG SIZE  rcvd: 84
```

## Összefoglalás

 * Az első esetben láttuk, hogy regisztrálódik a belső IP és a belső portok
 * A második esetben a külső IP és a külső portok
 * Az is látszik, hogy az első esetben bonyolultabban de kb. ugyanazt kapjuk mint a közvetlen linkelés (igaz a portokat lekérdezhetnénk API-ból). Egy gépnél tehát valószínű nem éri meg használni
 * Nem tértem ki rá, de az is látszott, hogy a ```SERVICE_NAME```-el mindig definiáltam a service nevét. Enélkül a konténer __típusát__ használja alapnak a konténer neve helyett. (Ez remélhetőleg [változni fog][issue])

A consul alkalmazása ott kezdődik, ahol több gépen futnak már a docker konténereink, és ott folytatódik, amikor a több gép docker konténereit egy virtuális hálózatra fűzzük fel. Ilyet tud pl a [Weave][weave] (aki, micsoda véletlen, épp a registrator szponzora) vagy a [Flannel]. Ezek az eszközök viszont már megint egy szinttel feljebb visznek minket, ami pedig megint egy következő történet lesz.

[1]: http://blog.dpc.hu/posts/docker-linking/
[registrator]: https://github.com/gliderlabs/registrator
[issue]: https://github.com/gliderlabs/registrator/issues/267
[weave]: http://weave.works/net/
[flannel]: https://github.com/coreos/flannel

