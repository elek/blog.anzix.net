---
title: Docker konténerek linkelése
layout: post
author: elek
type: dpc
---

A docker legjellemzőbb felhasználási módja, amikor az alkalmazásunk több docker konténerben szétosztva fut. Vélhetően van egy futó docker konténer, ami az adatbázist nyújtja, és mondjuk van egy, amiben a backend fut (REST interface-ek) és van egy amiben a frontend (single page js app).

Célszerűen a frontend-ben egy nginx fut, ami kiszolgálja a statikus html/css/js fileokat és a /api kéréseket tovább proxyzza a backend felé.

A kérdés az, hogy hová kell proxyzni a kéréseket? A frontend és backend konténereket külön deployoljuk ezért várhatóan sokszor megváltozik az ip címük. Amire szükségünk van, az egy dinamikus összerendelés a kettő között, ami alapján a frontend mindig a legújabb backend példány felé tudja továbbítani a kéréseket. 

# Példa konténerek

A példa kedvéért vegyünk egy egyszerű http szervert backendnek:

```
docker run -d --name backend -p 8000:8000 python  python -m http.server
```

Majd futtassunk egy frontendet:

```
docker run -p 1600:80 --name frontend --link backend:backend -it nginx bash
```

Adjuk hozzá a ```proxy_pass``` direktívát a ```/etc/nginx/conf.d/default.conf``` filehoz, hogy bizonyos url alatt érkező kéréseket a backend API-jára irányítunk.

```
location /usr {
   proxy_pass http://?.?.?.?:8000
}
```

Majd futtassuk az nginx-et (```nginx```).

(Megjegyzés: általában itt /api url-t kell elképzelni, de mivel a backend kezdeményünk a root könyvtárat ajánlja ki http-n, játékból azt játszuk, hogy a /usr alatt vannak az értékes API hívások, amiket majd a frontend single page app fog hívogatni.)

Ez így mind szép, de mit írjunk a kérdőjelek helyére?

# Linking + environment variables

Mivel a két konténert [összelinkeltünk][2] (```--link backend:backend```), ezért a frontend konténerben elérhetőek azok a környezeti változók, ami alapján tudjuk, hogy hol keressük a backend-et.

```
BACKEND_NAME=/frontend/backend
BACKEND_PORT=tcp://172.17.0.34:8000
BACKEND_PORT_8000_TCP=tcp://172.17.0.34:8000
BACKEND_PORT_8000_TCP_ADDR=172.17.0.34
BACKEND_PORT_8000_TCP_PORT=8000
BACKEND_PORT_8000_TCP_PROTO=tcp
```

Sajnos az nginx [nem támogatja][1] a környezeti változók használatát a config fileokban, de kis erőfeszítéssel tudunk olyat írni, hogy indulás előtt lecseréljük a ```proxy_pass``` értékét a környezeti változó alapján. (```man sed```)

Ha megcsináltuk, a konténerek elkezdenek tökéletesen együttműködni. A böngészőből a _http://localhost:1600_ cím a statikus tartalmat, a _http://localhost:1600/usr_ a proxzyott api hívásokat adja vissza.

Egészen addig, amíg újra nem deployoljuk a backendet (docker stop backend, docker rm backend, docker run --name backend ...). Ilyenkor ugyanis jó eséllyel új ip címet kap a konténer és a kapcsolat a két konténer között megszakad addig amíg a frontendet is újra nem indítjuk.

# Linking + host file

Szerencsére a docker linkelésének van egy másik oldala is. A ```/etc/hosts``` file __dinamikusan__ frissül a linkelt konténer aktuális ip címével:

```
172.17.0.51	frontend
172.17.0.51	frontend.bridge
172.17.0.37	backend
172.17.0.37	backend.bridge
```

Tehát ha újraindítjuk a frontend-et: a környezeti változókban még a régi ip-k lesznek, de a host file-ban az újak. Tegyük tehát a _backend_ hostnevet a proxy_pass direktíva után.

Sajnos így sem megy. Az nginx ugyanis cacheli a domain név feloldásokat. Ha a domain névszerverből jön [mondhatunk timeout-ot][3], de a ```/etc/hosts``` file örökre cachelődik.

(Elvileg rakhatnánk az nginx mellé egy lokális dns szervert, például _dnsmasq_-t, de csak bonyolítaná a dolgot, ráadásul a dnsmasq-t se egyszerű rávenni a host file újra olvasására.)

# Ambassador pattern

Tovább válogatva a megoldások között szembe jön az [ambassador container][3] minta, ahol egy harmadik konténert teszünk a backend és a frontend közé, ami csupán routolja a kéréseket. Sajnos azonban a leírással ellentétben ez a mi problémánkat nem oldja meg, ha a backend megváltozik (új ip), akkor az ambassador konténert is újra kell indítani és utána pedig a frontendet. (Az ambassador konténer előnyeit úgy tűnik nem csak [én nem értem.][5])

# Grand ambassador

Szerencsére azért van még más megoldás is. A [grand ambassador][6] konténerben nem egy egyszerű socket proxy lakik, hanem egy go program, ami a docker event stream-jéből rájön a változásokra és konténer újraindítás után jó irányba fogja proxyzni a kéréseket:

```
docker run -d -v /var/run/docker.sock:/var/run/docker.sock --name backend_ambassador -p 7000:8000 cpuguy83/docker-grand-ambassador -name backend
```

Látható, hogy a docker.sock-ot bemappeltük a konténerbe, hogy az ambassador matathasson benne, és lássa mi változik. De cserébe innentől a _backend_ambassador_ 7000-es portja újraindítás után is a backend-re mutat, ezért a _frontend_ már összelinkelhető a _backend_ambassador_-ral.

Igaz cserébe kicsit bonyolítottuk a dolgot. Az összes api hívás forgalmát átküldtük egy plusz rétegen (nagy terhelésekre minimum tesztelni kéne, keep-alive, stb...) és egyel több konténerre van szükségünk.

# Port over host 

Egy egyszerű megoldás azonban van még. 

A frontend docker konténerből ugyanis nem csak a backend konténer érhető el, hanem a host gép docker interface-e is.

```
4: docker0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    link/ether 02:42:55:33:33:99 brd ff:ff:ff:ff:ff:ff
    inet 172.17.42.1/16 scope global docker0
       valid_lft forever preferred_lft forever
```

 Mivel  backend konténernek publikáltuk a portját, nincs más dolgunk, mint a host gép docker interface-ének ip-jét használni. Ez az ip, ha nem is túl kanonikus módon de [elő varázsolható][7], és vélhetően sokkal kevésbé fog változni (max docker daemon restartok után). 

Ez egy kicsit lazábban csatolt, de biztos kapcsolatot ad a két konténer között

# Service discovery

A fapados és egyszerű megoldás tehát a docker host ip-jének és a publikált portnak a használata. De persze egy komolyabb környezetben valószínű komolyabb eszközök is vannak: pl. egy key-value store, amibe minden service-t regisztrálunk és lekérdezhetünk (akár DNS interfacen keresztül mint pl. a [Consul][9]-nál). Ezek a megoldások már akkor is működhetnek ha több gépen futó konténereket akarunk összekapcsolni. De erről a szintről majd egy másik történet fog szólni...


[1]: https://docs.apitools.com/blog/2014/07/02/using-environment-variables-in-nginx-conf.html
[2]: https://docs.docker.com/userguide/dockerlinks/
[3]: http://nginx.org/en/docs/http/ngx_http_core_module.html#resolver
[4]: https://docs.docker.com/articles/ambassador_pattern_linking/
[5]: http://stackoverflow.com/questions/26604734/failing-to-see-how-ambassador-pattern-enhances-modularity-simplicty-of-contain
[6]: https://github.com/cpuguy83/docker-grand-ambassador
[7]: http://stackoverflow.com/questions/22944631/how-to-get-the-ip-address-of-the-docker-host-from-inside-a-docker-container
[8]: http://www.slideshare.net/jpetazzo/shipping-applications-to-production-in-containers-with-docker
[9]: https://consul.io/
