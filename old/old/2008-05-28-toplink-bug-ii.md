---
layout: post
title: Toplink bug II.
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2008/05/topling-bug-ii.html
  _edit_last: '2'
---
Újabb szép Toplink Essentials bug vett el egy (eddig) egy napot a
projektünkből. Prototípus projektet még nem sikerült csinálni, de jól
reprodukálható, és ismét a leszármaztotott osztályok mint entitások körül van
a gikszer, csak most a belső cache táján. A szépségét jól jelzi az, hogy ha a
tesztelés két lépése között újraindítom a Glassfish-t, akkor minden megy, ha
nem, akkor OptimisticLocking exceptiont kapok. Előtte mg utána csak persiste
és find-van, de a find hol a szülő, hogy a gyerek entitásra keres rá.

  
A workaround egyelőre a Toplink level 2 cache-nek kikapcsolása:

  
&lt;property name="eclipselink.cache.shared.default" value="false"/&gt;

  
De most épp valami hasonló hiba néz ki a kódból, amit még nem derítettünk fel,
úgyhogy lehet, hogy ez se segít. Egyébként EclipseLinke M7-tel a helyzett
ugyanez. Lehet, hogy Hibernate JPA-val is ki kéne próbálni, de az meg a kissé
bonyolult entitás struktúránkba hal bele (Bizonyos dolgokat annotációval,
másokat XML-ből állítunk be).

  
  

