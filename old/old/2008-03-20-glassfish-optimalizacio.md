---
layout: post
title: Glassfish optimalizáció
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2008/03/glassfish-optimalizci.html
---
Gyorsan feljegyzem magamnak, hogy miket használtam a Glassfish tunninghoz.

A két gyorstalpaló Jean-Francois Arcand-tól [itt](http://weblogs.java.net/blog
/jfarcand/archive/2007/01/configuring_gri.html) és [itt](http://weblogs.java.n
et/blog/jfarcand/archive/2007/03/configuring_gri_2.html) olvasható. Alap
trükkök csak: a -server használata, GarbageCollector és memória hangolás, és
persze a poolok megnövelése. Ezek összességében olyan 15%-os teljesítmény
növekedést eredményeztek nálam.

  
Körülbelül ugyanilyen fontos, hogy az acceptor-threads paramétert (http-
listener) annyira állítsuk, ahány processzorunk van (vagy magunk). Core 2 Duo
esetén pl. a 2-es érték érezhetően gyorsít, de efelett persze már nem segít.

  
Kellemes meglepetés az is, hogy a Sun-nak mennyire jó tunning dokuja van a
glassfishez (elérhető [innen](http://docs.sun.com/app/docs/doc/819-3681)).
Nagyon részletes és a triviális változtatások mellett leír egész szép
trükköket , még oprendszer szintűeket is.

  
[Ez](http://weblogs.java.net/blog/sdo/archive/2007/03/ab_considered_h.html)
meg csak egy rövid figyelmeztetés, hogy miért ne az apache ab-vel terheljünk.

  
Egyébként pedig átlagos Desktop gépeket terhelve (Core2Duo 2-3G ram) egy jsp +
custom tag + statless session bean + 1 db JPA query alkalmazással, kb.
1800-2200 lekérés/sec-et sikerült elérni. Statikus html ennek a 2-3 szorosáig
simán felmegy. És nagyon nem is foglalkoztam sokat vele, pl. egyáltalán nem
néztem meg, hogy itt az adatbázis-e a szűk keresztmetszet.

  
  
  

