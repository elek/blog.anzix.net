---
layout : post
title  : JHacks
tags   : wiki, jhacks
date   : 2013-06-06 21:30
---

Emlékszik valaki még a jhacks.hu-ra? Még [Kocka](http://iwillworkforfood.blogspot.com) kezdte el csinálni, kb. 2004 és 2008 között virágzott. Magyar nyelvű javaval foglalkozó wiki oldal volt, elsősorban olajos kezű programozók szemszögéből. Tömör, tapasztalatok szülte leírások voltak rajta, nem akart se olyan csiszolt se olyan objektív lenni mint a hagyományos wikipedia. Aztán lassan eltűnt a süllyesztőben. A hosztolása megszűnt, és a snipsnap wiki motort -- ami működtette -- se fejlesztették tovább.

Nemrég találtam egy utolsó mentést róla. Még azért kunyeráltam el Kockától, mert 2008 környékén voltak olyan terveink, hogy átmigráljuk XWiki-re, amiből aztán nem lett semmi. Most viszont megtaláltam a migráló scriptet is, és kicsit átírtam és generáltam az egészből egy Jekyll site-ot.

A Jekyll a statikus blog generálók öregje és zászlóshajója. Lényege, hogy elég egy command line és text file-ok (na meg némi ruby script) egy bloghoz (a text fileok legtöbbször markdown szintakszisban), amiből lehet statikus oldalakat lehet generálni. Alacsony szintű, kódszagú dolog, talán ezért lett viszonylag népszerű geek körökben. (Ezt a blogot is Jekyll generálja egyenlőre). A Github pages [natívan támogatja](https://help.github.com/articles/using-jekyll-with-pages) (pluginek nélkül). 

Csináltam tehát egy [git repót](https://github.com/elek/jhacks/) rengeteg [szöveges file-al](https://github.com/elek/jhacks/tree/gh-pages/wiki), ami remekül [nézegethető](http://elek.github.io/jhacks/) a github pages oldalról. A [migrációs szkriptnek](http://github.com/elek/snipsnap2jekyll) vannak még hibái, de azért elértem egy szintet, ahol már szerintem élvezhető a tartalom.

Ha valakit érdekel, milyen volt a java világa kb. 5-8 évvel ezelőtt, bátran lapozgasson bele.

PS: igazából csak read-only archívumot akartam csinálni, hogy ne vesszen el, de beleolvasgatva az oldalakba, egy csomó helyen írtam volna kiegészítést. Egyelőre próbálok ellenállni a kísértésnek, de ha lenne másnak is kedve text file alapú, java wikit szerkesztgetni, engem könnyen be lehetne lelkesíteni...
