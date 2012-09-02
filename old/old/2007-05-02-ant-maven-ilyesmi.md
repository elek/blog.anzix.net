---
layout: post
title: ANT, Maven, ilyesmi
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2007/05/ant-maven-ilyesmi.html
---
Ami egy kicsit is megközelíti a Maven2 képességeit, is ANT-ra épül az az
[IVY](http://incubator.apache.org/ivy/). Jelenleg az Apache inkubátorában
pihen, és egy remek jó dependency tool. Mivel ANT-ra épül nagyon jól be lehet
passzintani mindenhová (pl. Netbeans, ami kezd jó ANT-ra épülni), ahová Maven2
plugin nincs is. Az API-ja is ígéretesnek tűnik, ki lehet cserélni jól a
dependecy kezeléstől a latest verzió algoritmusig elég sok mindent. Ráadásul
félig meddig kompatibilis a Maven-nel (pl. tudja olvasni az ibiblio-t).

  
Csakhogy ez idáig egy dependency management rendszer, és semmi több. A
Maven2-t azért szeretik az emberek (vagy: ha szeretik, azért :) mert a
definiált konvenciókkal sokkal egyszerűbb minden (erre múltkor volt egy
frappáns angol kifejezés), azaz, ha mindig ugyanúgy buildelek, akkor érdemes
ezt a részt csak egyszer megírni, és nem mindig implementálni ANT-ban.

  
Eddig oké. Természetesen ezt meg lehet csinálni IvY+ANT párossal is. Az ANT-
nak elég jó API-ja van, az IVY szállítja a csomag és függőség kezelést. Csak
azt kell elérni, hogy a letöltött csomagokban lévő osztályok integrálódjanak
az ANT-ban (ezt nem lehetetlen), és azok rögtön beleszóljanak az api-ba. Így
elérhetjük előszőr is, hogy a szokásos ANT taskok (pl. compile, jar, stb.)
sehol se várjanak alapértelmezett paramétert, hanem mondjuk ahelyett valami
magic propertyt használjanak. (Szimplán leszármaztatjuk az ANT taskokat), a
magic propertyket meg előrde definiáljuk, ez lesz a konvenvió.

  
Sőt, azt is el lehet intézni, hogy alapértelmezett targetek legyenek (pl.
compile, run, deploy), amik az ANT fájlban ugyan nincsenek benne, de meg lehet
őket hívni a scriptből. (Feltéve, hogyha a csoda ivy+ant dolgunk a
classpathban van). Meg mondjuk azt is megengedjük, hogy az alapértelmezett
compile parancsot is felüldeifinálja a user, ha ő mindig más compile-t
szeretne.

  
Ez szép, de akkor mi a kérdés? Hát az, hogy ilyen rendszer nincs. Jelenleg
ugyanis Maven2 van, és mindenki (akinek van egy kis esze) azt használja. Amit
felvázoltam arra lehetne egy Proof-of-Conceptet írni, de jelenleg nincs ilyen.
Márpedig egy nemlétező program architektúrájáról előadást tartani meglehetősen
öncélú dolog. Vagy fogom magam, és megírom az egészet, és tényleg komolyan
veszem, és fegyverkezési versenybe kezdek a Maven2-vel (sok munkaórát
beleölök), vagy hagyom az egészet. Ebben az esetben viszont elég felesleges
előadást tartani egy olyan konkrét termékről (a konkrét termékről szól
előadások már gyanúsak), ami nem is létezik, csak létezhetne, tehát a
hallgatóság részéről gyakorlati haszna semmi nincs. (Kivéve egyetlen trükköt,
hogy hogyan lehet automatikusan azzal definiálni ANT taskot, hogy egy jar-t
bedobunk a classpath-ába). Sokkal inkább értelme van, egy létező dolog
bemutatására konkrét tapasztalatokkal (vér, veríték).

  
Hát ezért bizonytalanodtam el, hogy érdemes-e megtartani a Maven2-es JUM
előadás ANT-os párját. Mert ha az szólna valamiről nem az ANT-ról szólna, mert
az egyértelműen nem ellenfele a Maven2-nek (Ezt egyébként a Maven oldal is
igyekszik tisztázni, hogy ez nem csak egy másik build tool, hanem valami több
annál). És amiről szólna, olyat meg úgy se fog használni senki.

  
Szerintetek?

