---
layout: post
title: Napfényes hétvégék emléke
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2007/04/napfnyes-htvgk-emlke.html
---
(Énblog)

  
Telefonbeszélgetés után emailben kaptam néhány anyagot, ami távolról talán
specifikációnak látszott. Meg volt köztük egy konferencia abstract is rengeteg
bullshit-tel, meg egy megjegyzéssel, hogy igen, van működő prottípus
szoftverük az algoritmushoz, és mennyire jó.

  
A beszélgetés us lefolyt, ekkor már nem egy hét, de 5 nap is alig volt a
konrefenciára való indulásig, és kiderült, hogy az a szoftver, amit még senki
sem látott, és nagyon gyorsan kéne. És aztán jött a rapid programozás. Nem
mondom, hogy erre a kódra leszek a legbüszkébb, bár azért azt látom, hogy
összehasonlíthatatlanul jobb ez a rapid kód is, mint mondjuk a néhány évvel
ezelőtti. Hiába, csak tapasztal az ember, és egy Observer minta tényleg már
csak izommunka. No meg a Hivatalban is megszoktam már, hogy mindent szépen
dokumentálva és codestylolva, itt meg csak egyetlen szempont volt. Gyorsan egy
működő demót.

  
Volt egy olyan rész, amit megírtak nekem előre C-ben, hogy az algoritmuson ne
kelljen tökölődni. Copy-paste és kis kozmetika után ment is, majd néhány teszt
után több helyen is elszállt. Kiderült, hogy a C-s ugyan működött, de kapásból
két puffer túlcsordulás volt benne (nem túl lényeges helyeken), amire persze a
Java rögtön dobta az IndexOutOfBondokat.

  
(Közbe regisztráltam a dev.java.net-re valami JUG szerű oldalt, remélem lassan
approvolják is. Azzal is haladni kéne.)

