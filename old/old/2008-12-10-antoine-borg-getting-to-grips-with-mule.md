---
layout: post
title: ! 'Antoine Borg: Getting to grips with Mule'
tags:
- Devoxx
- esb
- mule
- soa
status: publish
type: post
published: true
meta: {}
---
Lefekvés előtt hallgasson Mule előadást ön itt. Elmondjuk önnek, hogy a Mule
mire jó és miért.

  
A Mule egy remek ESB megoldás, semmilyen szabványt nem támogat, de nagyon
egyszerűen és gyorsan működik. Mindent össze lehet kötni mindennel, minden
része kicserélhető. Kicserélhető a tranzakció kezelő, kicserélhető a szál
kezelés, minden. Olyannyira, hogy nem csak ESB mintát tud megvalósítani, hanem
bármilyen más mintát. Nem feltétlenül kell az üzeneteknek egy buszon menni, a
példányok kommunikálhatnak egymással is (ha akarjuk). Ha akarjuk tud XA
tranzakció kezelést is (egy példányon belül).

  
Azt kell mondanom, hogy szimpatikus lett. Olyan egyszerű, amennyire csak
lehet, és annyira kiterjeszthető, amennyire csak lehet. Nem kell. pl a buszon
belül feltétlenül, XML-t beszélni, bármit használhatunk, amit szeretnénk. Csak
okos transzformereket kell használni/írni.

  
Az előadó szerint a hibái: a clusterezés natívan nem megoldott (ügyes átmeneti
tárolókat kell használni, és akkor lehet elosztani a terhelést). Ezen még
dolgznak.

És ha elkezded kicserélni a dolgokat, akkor függeni fogsz a Mule-tól. Ez van.
Viszont addig könnyű életed lesz.

