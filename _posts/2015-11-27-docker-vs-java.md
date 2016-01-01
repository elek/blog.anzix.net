---
title: Docker + Java?
layout: post
author: elek
type: dpc
tags:
  - docker
  - springcloud
  - spring
  - nomad
  - capsule
  - kubernetes
---

Láttam már _Java_ projektet docker-re váltani és láttam már projektet visszaváltani docker-ről. Mert a docker ugyan elég erős kártya és sok mindent üt, semmiképpen nem aduász. Legalábbis ha Java világról beszélünk.

## Docker

__Komplex futtatókörnyezet__: Ha az alkalmazásunk futtatása több mint egy sima jar elindítása, mindenképpen hasznos lehet, hogy minden tudás a futtatáshoz egy docker konténerbe lesz beleégetve. Pl. ha elképzelem hogy egy wildfly alkalmazás szerver (vagy Fuse OSGi konténer) kell hogy fusson (akár más processzekkel együtt), pláne ha az alkalmazásszerverbe plusz modulokat és jar-okat kellett telepíteni, akkor jó eséllyel könnyebb lesz az életünk, ha ezt egyszer lescripteljük egy Dockerfile definícióban.

__Változó futtatási környezet__: Képzeljük el ráadásul, ha ezek változnak. Mondjuk a 23.2-es alkalmazásunkhoz még derby-client.jar kell a wildfy-ba, a 24.0-ban már mongodb. Elvileg megtehetjük, hogy ezeket valami provisioning eszközbe definiáljuk (ansible/puppet/chef, de ha lehet választani, akkor ansible). Ilyenkor viszont a provisioning eszköz definícióit is verziózni kell és valahogy biztosítani kell, hogy a megfelelő verzióval deployoljunk. (valamint mindig leprogramozni a dowgrade-eket is) Ennél jóval egyszerűbb a docker, amivel egyszerűen vissza tudunk váltani az előző konténerre és akkor még az előző setup fog futni. 
 
__Erőforrások korlátozása__: A docker ezt is ingyen adja. Ha többre van szükségünk mint az _-Xmx_, pl. processzor korlátozásokra, akkor ezt egyszerűen megtehetjük. Természetesen itt sincs mágia, kézzel is megtehetnénk standard linux toolokkal (a docker is cgroup-ot használ), de itt megint bonyolultabb lesz, ha ezt docker nélkül verziózni akarjuk és automatikusan deployolni.

__Környezetek, verziók, és ezek közötti váltás__: Az egyik legfontosabb dolog tehát az, hogy egyrészt a docker konténernél elkészülnek a verziózott alkalmazáskörnyezetek (amiben egy adott verziójú alkalmazás együtt van az ahhoz a verzióhoz szükséges futtató környezettel). Másrészt nagyon megkönnyíti, hogy ezeket az alkalmazás+környezeteket egymás után futtassuk különböző konfigurációkban. (fejlesztői test, user acceptance test, production). Ez a környezetek közötti váltás szerintem az egyik legfontosabb előny, amit a docker-rel kapunk.

__Több gépen futó alkalmazáshalmaz__: És az is lehet hogy eljutunk oda, hogy kinőjük a környezetünket és egyszer csak azt vesszük észre, hogy egy 10+ gépen futó sokszor tíz docker container nyája közepén állunk. Dockerre épülő alkalmazások közül több is van, ami ezt a helyzetet nagyon megkönnyítheti. Az egyik legismertebb a kubernetes, de még sok más elérhető. Ezekkel általában rábízzuk az alkalmazásra, hogy valahol indítson abból még többet, ami nekünk kell és valahogy intézze el, hogy mindenki megtalálja (kicsit elnagyolva, részletesebben talán egy későbbi bejegyzésben)

## Nem docker

Az előzőekért cserébe a docker természetesen magával hozza a saját komplexitását. Semmi sincsen ingyen. És vannak esetek, amikor nincs másra szükségünk mint egy egyszerű _java -jar_-ra.

__Egyszerű futtatási környezet__: Mondjuk képzeljünk el egy sima spring-boot/spring-cloud alkalmazást, ami tényleg nem több mint egy _java -jar_. (vagy [sparkjava][sparkjava], [dropwizard][dropwizard], stb.). Itt egy dologra van szükségünk, egy szerverre meg egy JVM-re. Ha nem gyakran változik a környezet (mondjuk a JVM verziója), docker nélkül se egy mágia jar fájlokat mozgatni és indítani (és mennyivel kisebb és egyszerűbb az egész). 

__Docker-compose__: Bárhogyan is megpróbáljuk beleégetni a konténerekbe az egész futtató környezetet végső soron lesz valami leíró, ami azt mondja meg, hogy ha több konténerünk van, azok hogy működjenek együtt (linkelések, portok, stb.). Erre előbb utóbb lesz valami alkalmazás, amiből a legkézenfekvőbb a _docker compose_, de a kubernetesnek és más tooloknak is vannak saját leírói. Ezek tehát így is úgy is kilógnak a konténerek zárt világából, és ha már ott tartunk, hogy _konténerek + leíró_, akkor már csinálhatnánk azt is, hogy _jar fileok + leíró_.

__Egyszerűbb konfiguráció, futtatás__:
Ha nincsenek docker containereink sok minden leegyszerűsödik. Nem kell szüttyögnünk a Dockerfile-okkal és azok tesztelésével. Nem kell azokra a kérdésekre válaszolni, hogy mikor frissült vajon a docker containerünkben lévő oprendszer (biztonsági frissítések??) vagy hogy hogyan fogjuk az összes docker container syslog-ját egyszerre látni.

__Fejlesztés__: A docker-ben elvileg az a jó, hogy fejlesztési időben is pont el tudjuk indítani a későbbi production környezetet. A gyakorlatban viszont azt látom, hogy ezt csak komplex setupoknál csinálják a fejlesztők (pl. egy fuse konténer mindenféle extrával), ha csak egy jar file-t kell elindítani, akkor azért a fejlesztők inkább elindítják azt az IDE-ben és gyorsabban haladnak.

__Nem lineáris komplexitás növekedés__: Az eddigiekben leírtak mellé képzeljük oda, hogy valaki nem tud ellenállni a microservice hype-nak (erről majd szintén lesz szó még később). 3 konténert (backend + frontend + valami) még nagyon kényelmes docker-re kezelni, de ha az alkalmazásunk már mondjuk 25 microservice instanceből áll és van test/production/uat, akkor már 75 docker konténer lesz a compose fájlban, amit össze akarunk linkelni.

__Spring cloud__: Persze ha 25 instance-ből áll az alkalmazásunk, akkor így is úgy is szívás lesz. Olyan varázslat nincs ami megszünteti a komplexitást, csak olyan, ami át helyezi egy olyan területre, ahol esetleg jobb tooljaink vannak. A spring cloud pl. számos olyan szolgáltatást ad (service registry, configuration server, api gateway, loadbalanced clients), amik segítségével leegyszerűsíthető a futtatás, és végül el tudunk jutni oda, ahová docker-rel is. Mert csak el kell indítanunk egy csomó jar fájlt véletlenszerűen egy csomó vason, akik mind benéznek a config szerverhez, beszólnak a service registryben, megtalálják egymást és működnek.

## Harmadik út?

Minden eszköz csak egy legódarabka a játékban és sok mindent meg lehet építeni a meglévő eszközökkel.

Az azonban látszik, hogy sokan keresik az utat és gondolkodnak, hogy mit tehetné meg kezelhetővé a helyzetet.

__Nomad__: A Hashcorp például csinált egy olyan scheduler-t [Nomad][nomad] néven, ami azt tudja, mint a docker-re épülő társai. Ha megmondjuk neki, hogy kell még egy instance, annak megkeresi a megfelelő helyet (ugye ez már a 10+ gép + microservice instance-ek garmadája helyzet) és ott elindítja. Ráadásul okosan csinálták meg: nem egy teljes konténer cluster-t akartak csinálni (mint a kubernetes), hanem csak egy funkcióját, a schedulert, az viszont használható mindennel együtt (ráadásul támogat docker-t is és standalone jar-okat is).

__Capsule__: Vagy itt van a [capsule.io][capsule]. Ez eredetileg azt tudja, mint a maven shade plugin, egy nagy futtatható jar file-t csinál. amit csak el kell indítani. Kicsit trükkösebb, mert az eredeti jar fileokat használja, csak kicsomagolja egy temporális könyvárba, ezért nem kell foglalkozni a leírók összefésülésével, mint a shade pluginnel.

Sőt, kitalálták azt is, hogy innentől az, hogy _hogyan_ futtassuk igazából pluginelhető kell hogy legyen (caplets-eknek hívják). Ha tudja milyen Java osztályt kell elindítani, azt eltudja indítani sima process-ként, service-ként, vagy úgy hogy a függőségeket közvetlen egy maven repóból frissíti be (hmm, easy autoupdate...).

És ha már itt tart, akkor az [egyik caplet][shield] el tudja indítani a jar file-t egy lightweight lxc konténerben is.

(Megjegyzés: Kár hogy a capsule maven/gradle pluginjei még elég fapadosak, és az alap capletsen felüli dolgokat kicsit szenvedés bevarázsolni, és némelyik caplet is elég teszteletlen, pl pont a serviceként futtató jvsc wrapper).

De az irány érdekes. Végül is docker-rel is eljátszhatnám, hogy a konténer maga mindig ugyanaz és nem buildelem le, viszont a sima meztelen jar-omat már egy (vélhetően ritkán változó, verziózott) docker containerben indítom el. Ekkor a docker előnyei is megmaradnak, de a komplexitásból is vágtunk kicsit (illetve áthelyeztük a komplexitást azokra a szolgáltatásokra, amit mondjuk a spring-cloud ad sima java processzként).

[nomad]: https://github.com/hashicorp/nomad
[capsule]: http://www.capsule.io/
[shield]: https://github.com/puniverse/capsule-shield
[sparkjava]: http://sparkjava.com/
[dropwizard]: http://www.dropwizard.io/
