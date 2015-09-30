---
layout: post
title: "Brian Goetz: A peek under the hood"
date: 2013-11-13 12:00
tags: 
   - devoxx
   - lambda
   - jdk
type: dpc
---

Brian Goetz a keynote alatt olyan meggyőző volt, olyan jó olajos kezű munkás embernek tűnt, hogy beültem az előadására is. Nem bántam meg.

Az előadás nem a konkrét használatról szólt, hanem, hogy JVM szinten hogy oldották meg a Lambda Expressionök (LE) használatát (és miért úgy).

A két nagy döntés, hogy mi legyen a típusa az LE-knek, és hogyan reprezentálja őket a JVM. Mindenhol szóba került az *obvious but wrong* megoldás is.

Típus szinten lehetne külön nyelvi elemet, byte code műveletet bevezetni rájuk, de ez sok mindent felforgatna (obvious but wrong). Végül típus szinten *functional interface* ként kell tekinget rájuk, amik leginkább a *Runnable* szerű egy metódusú interface-ek örökösei.

Reprezentáció szinten is sok kerülő út jön számításba. Pl. lehetnének annonymous inner classok, de ekkor rengeteg példányosításra lenne szükség. Implementációban végül a dinamikus nyelvek kedvéért bevezetett invokedynamics-ra esett a választás. Itt a hagyományos invoke... bytecode művelett helyett egy külön kódot lehet definiálni, ami megmondja a JVMnek, hogy mit hívjon meg. LE-k esetén egy speciális MethodFactory-ra lehet hivatkozni, ez annak a kódnak a szimbolikus neve, ami implementáció függően meg mondja, hogy mit hívjon meg a JVM egy új Lambda expressiont látva. A *mit* az lehet akár annonymous inner class vagy generált osztály, bármi. A szép a megoldásban is, hogy ez nem dől el a bytecode-ban, hanem csak a JVM implementációban ezért később változhat is. És pontosan ezért a LE-ök gyorsabbak lesznek az inner classoknál. Ott a byte code implementáció kötött, de itt dinamikus. Már a mostani implementáció is sokszor gyorsabb, de rajta vannak a témán, hogy elkezdjék optimalizálni.

<a href="http://www.flickr.com/photos/108542198@N03/10836688086/" title="Untitled by dpcconsultingltd, on Flickr"><img src="http://farm8.staticflickr.com/7334/10836688086_d1f9f33dae.jpg" width="500" height="375" alt="Untitled"></a>

Mindez egy nagyon dinamikus lehengerlő előadói stílusban.