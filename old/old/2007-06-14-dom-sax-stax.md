---
layout: post
title: DOM, SAX, StAX
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2007/06/dom-sax-stax.html
---
XML-t parsolni rengeteg féle képpen lehet, a legismertebb módszerek mégis a
fent említett apik. A [DOM](http://jhacks.anzix.net/space/DOM) berántja az
egész fájlt a merióba és viszonylag kényelmesen lehet utána kutakodni benne. A
[Sax](http://jhacks.anzix.net/space/sax) egy sokkal kevésbé erőforrás
igényesebb push parser: a feldolgozó megy végig az elemeken és közben a
találta elemeknek megfelelő földolgozó függényeink (startElement,
startDocument,...) szájába nyomja bele az adatokat. a
[StAX](http://jhacks.anzix.net/space/StAX) ezzel szemben remek pull parser.
Szintén kevés erőforrsát eszik (nem tartja a memóriában az egész fájlt), és
nem ő dirigál, hanem a programunk. Ha én azt mondom, hogy kérem a következő
XML elemet, akkor megy tovább csak a parsolásban.

  
Hogy melyiket válasszuk, az a szokásos attól függ kérdés. Rövid [segítség a dö
ntésben](http://java.sun.com/webservices/docs/1.6/tutorial/doc/SJSXP2.html#wp1
01396) pl. a java tutorialban.

  
Nálam a konkrét példa ez volt: viszonylag kicsi XML-ek zúdulnak rám
eszméletlen sebességgel (JMS). Meg kell keresni mindegyikben két teget (kb. az
első negyedben vannak) és az alapján kell megnézni, hogy akarok-e e velük
kezdeni valamit. Amivel akarok, az kevesen van, azt már bárhogy
feldolgozhatom.

  
Mivel gyorsnak kell lennni, egyértelmű hogy StAX vagy SAX. A StAX
feldolgozását könnyen meg lehet szakítani (mivel én dirigálom, mikor jöjjön a
feldolgozás bármikor abbahagyathatom), a SAX feldolgozásból legfeljebb
exceptionnal lehet kijönni (ami azért nem egy szépségdíjas megoldás). Legyen
tehát StAX. Illetve legyen mind3, és mérjem meg, hogy tényleg annyival
gyorsabb-e a SAX/StAX mint a DOM, és hogy a konrét esetben a StAX/SAX sebesség
mennyire vethető össze.

  
Nosza gyorsan összedobtam a kódokat, és rájuk eresztettem 3000 XML fájlt. Az
eredmény: DOM ~ 100% sec, SAX ~ 80-90% sec, StAX 50 ~ sec. Érdekes, hogy a
nagy szakadén nem a Stax/SAX vs. DOM között van, hanem a a StAX és az öszes
többi között.

  
A történet szépsége az persze, hogy kiderült, hogy 3000 fájl feldolgozása is
max 2-4 sec, és mivel adatbázisba is kell írni belőlük az adatokat, ezért
valószínű tök mindegy mit használok, mert nem a parzolásnál fogok elvérezni.
(Ráadásul háttér procesz, ahol 1-2 mp nem számít).

