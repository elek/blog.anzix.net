---
layout: post
title: ! 'Jeanfraoncis Arcand: Introduction NIO2'
tags:
- aio
- Devoxx
- nio
status: publish
type: post
published: true
meta: {}
---
Az AIO = NIO2 nagyszerűségéről hallhattunk mondatokat. Az alapállítás, hogy a
NIO1-hez képest sokkal könnyebb használni, nem leszünk annyira kiéhezve a
frameworkokra (MINA, Grizzly, stb.)

  
Az előadás felhőtlen élvezetéhez NIO1 expertnek kellett volna lennem (ahogy
nagyon nem vagyok az). Azt azért megtanultam, hogy hogy kell dead lock-ot
implementálni (a Completion Handler-ben kell várni valami eseményre, és nem
visszatérni gyorsan). És a dallama iis egész jól kiderült a végére, meg az,
hogy hiába lett egyszerűbb a NIO Api, ezért rengeteg kedves gödör van amire
bele lehet esni, hogy ha gondolkodás nélkül használunk (pl. a fent említett
dead lock). Az előadásban ilyen gödröket kerülgettünk és láttuk a Grizzly
megoldásait (az [előadó](http://weblogs.java.net/blog/jfarcand) a Grizzly
fejlesztője).

  
Örültünk még egy fólián a NIO2-vel érkező File I/O System API-nak is (pl. van
benne könyvtár figyelés új fájlokra, és nem kell ezt se külön kitalálnunk) és
a a végén még megmérkőzött a Grizzly NIO1-es és NIO2-es változata. (JDK 7-en).
Nem sokkal, de az NIO2-es gyorsabb volt. Nem lett tehát sokkal gyorsabb (a
NIO1-hez képest) csak egyszerűbb az élet.

