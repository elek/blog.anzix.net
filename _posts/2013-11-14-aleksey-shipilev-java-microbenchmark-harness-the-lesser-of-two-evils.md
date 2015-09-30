---
layout: post
title: "Aleksey Shipilev: Java Microbenchmark Harness: The Lesser of Two Evils"
date: 2013-11-14 14:02
tags: 
   - devoxx
   - microbenchmark
   - caliper
   - jmh
type: dpc
---
Zseniális előadás. Azt eddig is mindenki mondta, hogy a microbenchmark veszélyes, de itt pontosan el volt mondva, hogy miért. Az előadó saját bevallása szerint is: elsősorban el akart mindenkit riasztani a microbenchmarkoktól és ez azt hiszem elég jól sikerült neki.

Sorozatosan jöttek a slide-ok, általában egy ártatlannak tűnő kóddal és egy meghökkentő mérési eredménnyel. És mindegyik furcsa mérési eredmény mögött valami kevésbé ismert Hotspot optimalizációs trükk volt. Egyre kevésbé ismert problémák jöttek elő, és a végén már valóban mindenki inkább lemondott volna a microbenchmarkokról, de saját keretrendszer írásáról biztosan. És mindezt nagyon gördülékeny és élvezetes stílusban.

Level 10-nél már az assemblyt is meg kellett nézni:

<a href="http://www.flickr.com/photos/108542198@N03/10855619236/" title="Untitled by dpcconsultingltd, on Flickr"><img src="http://farm4.staticflickr.com/3798/10855619236_b0a7f15997.jpg" width="500" height="375" alt="Untitled"></a>

Az előadó az Oracle-nél dolgozik, ahol a [Java Microbenchmark Harness](http://openjdk.java.net/projects/code-tools/jmh/)-t (JMH) ebben az évben nyitották meg. Elég meggyőzők voltak a mélységei. Eddig ebben a mezőnyben én a Google féle Calipert ismertem, de most arról is kiderültek érdekes dolgok. Ahogy mondta, ha valami furcsa eredmény érkezik hozzá általában először megnézi JMH-val, és ha más az eredmény, akkor már csak az a kérdés, hogy mi volt rossz az eredeti tesztben...

<a href="http://www.flickr.com/photos/108542198@N03/10855721254/" title="Untitled by dpcconsultingltd, on Flickr"><img src="http://farm3.staticflickr.com/2836/10855721254_eb940a68fd.jpg" width="500" height="375" alt="Untitled"></a>

Ezt az előadást nagyon ajánlom mindenkinek, aki ilyesmiben töri a fejét, vagy ha valaha lemert írni a blogján olyat, hogy egyik Java megoldás gyorsabb mint a másik. Elvileg a JVMLS-en is lement már, szóval lehet hogy meg lehet találni valahol a interneten, a Devoxx videók általában egy év után lesznek publikusak (Addig előfizetéssel lehet nézni őket a parleys-en.)

