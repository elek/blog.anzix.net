---
layout: post
title: További OSGi tapasztalatok
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2008/05/tovbbi-osgi-tapasztalatok.html
  _edit_last: '2'
---
OSGi-val való további ismerkedés keretében csináltam egy remek Jabber / XMPP
OSGI kozol bundle-t. A lényege, hogy nem csak op rendsze parancssorából
indított OSGi framework konzoljából pásztorolhatjuk a framework konzolját,
hanem Jabberen keresztül is. (Bundle-k listázása, leállítása, stb.)

Egy érdekes dolog, hogy konzolos parancsokhoz nincs szabványos OSGi interface,
ezért az összes framework külön talált rá megoldást (én eddig a Felix és az
Equinox alá implementáltam a bundlet). Ebben az a szép, hogy a pluginem kódja,
az Equinox és a Felix bizonyos osztályaitól is függ fordítás szinten, de futás
szinten csak akkor fog ráfutni olyan kódra, ahol Felix specifikus osztályokat
használok, ha létezik olyan beregisztrált service (a servicek String névre
vannak regisztrálva, a létezés az osztály nélkül is ellenőrizhető). Azt kell
mondjam, az OSGi koncepció működik.

Fejlesztéshez a [pax-construct](http://www.ops4j.org/projects/pax/construct/)
maven plugint használtam (Ami használja a [Felix
bundle](http://felix.apache.org/site/apache-felix-maven-bundle-plugin-
bnd.html) plugin-t is). Viszonylag kis szívás volt vele, csak egyszer kezdtem
el debugolni, de akkor is kiderült, hogy felesleges volt, a Felix bundle
dokumentációját kellett volna jobban átnyálazni. A fenti Classloader-es
trükhöz kell ugyanis finomhangolt Import-Package leírót gyártatni, hogy a
framework függőségek csak opcionálisak legyenek.

(Zárójeles megjegyzés: amilyen csapnivaló volt a NetBeans 6.1 Beta Maven
pluginje, a végleges annyira meggyőző. Pl. most már olyat is tud, hogy ha egy
ismeretlen osztályt lát, akkor egy klikkre felajánlja a központi repository-
ból azokat az artifactokat, amik tartalmaznak ilyen nevű osztályokat. És mivel
már a Glassfish 3 TP és az OpenESB 3 fejlesztés is Maven-be megy, úgy hogy a
NetBeans Maven támogatás csak jobb lesz ennél.)

Szóval jó kis játék volt, lehet hogy feltolom Google Code alá. Szinte
ugyanannyi ott projektet létrehozni, mint a saját szerveren belőni SVN-t.

