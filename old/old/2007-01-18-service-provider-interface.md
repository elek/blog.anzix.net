---
layout: post
title: Service Provider Interface
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2007/01/service-provider-interface.html
---
Eredetlieg azt hittem, hogy legalábis egy kiforrott API, de aztán kiderült,
hogy maximum egy tervezési minta.

  
Arról van szó, hogy van egy alap programunk, és szeretnénk kiterjeszteni a
funkcionalitást mindössze annyival, hogy bedobálunk a classpathba jar-okat.
A(z egyik lehetséges) megoldás:

  
Van egy interface, ezzel definiáljuk, a kiterjesztési pontot. A bedobállandó
jarokban implementáljuk az interface-t. (Eddig minden a szokásos).

  
Aztán csinálunk a jarokban egy könyvtárat és abban egy sima szöveges fájlt
(mondjuk META-INF/services/com.domain.csodainterface) és egy-egy sorban
felsoroljuk az implementáló osztályokat. A főprogram fogja a classLoader-ét és
a getResources(META-INF/services/com.domain.csodainterface) metódussal szépen
megkapja a fájl referenciákat. Ezekből kiolvassa a sorokat (amikben class
nevek van) és ezeket reflection api-val szépen meghívogatja.

  
Azt hiszem ez csak egy módszer, de meglepően sokat találkozom mostanában vele
(pl. Így lehet a radeox wiki engine-be új makrókat definiálni).

  
Linkek:

[Ethan Nicolas vázolja a helyzetet](http://weblogs.java.net/blog/enicholas/arc
hive/2006/04/creating_a_serv.html)

[Jar speckóban emlegetve](http://java.sun.com/j2se/1.5.0/docs/guide/jar/jar.ht
ml#Service%20Provider)

Ez utóbbi emlegetés különösen kedves, mert nagy bizonyossággal hivatkozik egy
Service.providers funkcióra, amit (ahogy számomra kiderült) nekem kell végül
is megírni a fent említett módon.

