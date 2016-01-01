---
title: HOUG konferencia, Java szekció
tag:
   - java
   - magyar
   - konferencia
layout: post
---

Nem is tudom mikor volt utoljára Java konferencia Magyarországon. Talán a régi Sun-os időkben és ott se a legvégén. Már csak ezért is nagy szó szerintem, hogy az idei HOUG  konferencián a Java szekció egy külön fél napot kapott. Az érdeklődők száma (az elején még plusz székeket is be kellett hozni) és az előadások színvonala is azt mutatta, hogy egy ilyen alkalom akár nagyobb időkeretet is (most csak kb. 25 perc volt egy előadásra) megérdemelne.

* __Schaffer Krisztián__ (cloudbreaker.co): _JavaEE Application Security_ -- Az előadás egy példa alkalmazást mutatott be, ami a várakozásnak megfelelően hemzsegett a biztonsági hibáktól. A hibák (legalábbis amiket volt idő megnézni) viszonylag a triviális oldalról indultak, de jól illusztrálták hogy a security hibák nem fehér hollók és mindenkivel szembe jöhetnek, még a legegyszerűbb formájukban is. A kérdés nem is az, hogy mi csináltunk-e már ilyet, hanem hogy van-e bármilyen olyan tesztünk, ami megmondaná, ha becsúszik egy hiba.

* __Elek Márton__ (DPC Consulting): _Java 8_ -- A Java 8 nem hogy a spájzban van, hanem múlt héten már ki jött a stabil verzió. Az előadás gerincét természetesen a legnagyobb nóvum a lambda kifejezések alkották és az ehhez járó stream API újítások és default interface metódusok.

* __Varga Péter__ (DPC Consulting): _Java EE 7_ -- A Java 7 EE nem olyan fiatal már mint a Java 8, de elterjedtnek nem túl elterjed. Az előadás elején a kérdésekre volt még aki JavaEE 5-ös verzióra tette fel a kezét. Kiemelt bemutatott példák: WebSocket, JSON parser, Barch processing, Concurrentcy Utilities, JMS 2.0, REST client, CDI, Bean Validation.

* __Cservenák Tamás__ (Sonatype): _Maven élete és halála_ -- A Maven-ről már sokan azt hittük, hogy végleg bent ragadt a csipkerózsika álmában és az új játékosok (pl. Gradle) le is hagyják. Ebben az előadásban viszont kiderült, hogy korán van még a temetéshez. Az előadó (aki amúgy a Nexus repository manager fejlesztője, tehát elég közelről látja a témát) beszélt a Maven eredeti koncepciójáról és a jövőben várható újításokról, amik főleg két téma körül csoportosultak: build futási idő (incremental build, párhuzamos build), continuous delivery (generations and workspaces, atomic deploys, branched development)

*  __Viczián István__ (IP Systems): _Continuous Delivery, problémák és megoldások__ -- Örvendetes, hogy a Continuous Delivery elvek lassan kezdenek a mainstream részévé válni. Az előadás szerintem nagyon jó egyensúlyt tartott az elméleti és gyakorlati részek között. Nem csak elméletről volt szó, hanem konkrét megoldásokról és trükkökről Az előadás fóliái megnézhetőek [itt](https://dl.dropboxusercontent.com/u/7683931/houg/HOUG.j%202014%20prezent%C3%A1ci%C3%B3.html)

* __Auth Gábor__: _Android és JavaEE_ -- Ezt az előadás azoknak mindenképpen ajánlom, akik ha Androidról szerver oldalt akarnak meghívni egyből EJB vagy RMI-re gondolnak. Persze a kanyarok és kerülőutak után (pl. SOAP) a végére csatlakoztunk azokhoz, akik szerint ebben a helyzetben se rossz választás a REST. Fóliák [itt](http://prezi.javaforum.hu/javaee-droid-rest-web/#/title)

Összességében abszolút megérte részt venni a rendezvényen. Remélem hogy jövőre vagy egy másik alkalommal már teljes nap hallgathatunk teljes előadásokat Java témakörben, mert sokszor 25 perc után épp akkor ért véget egy előadás amikor kezdett érdekes lenni.

**Disclaimer**: e sorok írója szintén előadott, a fenti sorok (ahogy mindig) magánvéleményét tükrözik.
