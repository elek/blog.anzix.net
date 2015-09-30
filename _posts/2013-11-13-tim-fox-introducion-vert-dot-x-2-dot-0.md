---
layout: post
title: "Tim Fox: Introducion Vert.x 2.0"
date: 2013-11-13 15:25
tags: 
   - devoxx
   - vertx
   - async
type: dpc
---

Már rég várok rá, hogy valaki meggyőzzön a [vert.x](http://vertx.io)-ről és ezt ez az előadás abszolút hozta.

* Teljesen moduláris felépítés. Sok kis apró rész eventbus-on beszélgethet egymással.
* A kis részeket szinte bármilyen JVM feletti nyelven meg lehet írni. (Java, Js, Ruby, Python, Scala...)
* Minden aszinkron, és elérhetőek aszinkron modulok elég sok mindenhez (Mysql, NoSQL, stb.)
* HA: a kis modulokat dobálja át egymásnak a több JVM processz.
* Tud csinálni magából és a modulokból egy fat jart.
* Fejlesztés barát, mert jól viseli, ha a kis apró részeket külön módosítgatjuk.

Ahogy az előadó mondta *node.js for JVM*-nek szokták hívni, és a hasonlóságot nem is tagadta, de ez gyorsabb annál és ugye több nyelvet is beszél.

Azért vannak nyitott kérdések. Az eventbuson csak egyszerű dolgok közlekedhetnek (a JSON a preferált, de ekkor ugye rámegy majd az idő egy része a parzolásokra). És az üzenetküldés se garantált, tehát a saját alkalmazásunkat kell erre valahogy felkészítenünk. De mindenesetre nagyon ígéretes. Mindenképpen használni szeretném majd valamihez.

<a href="http://www.flickr.com/photos/108542198@N03/10839259375/" title="Untitled by dpcconsultingltd, on Flickr"><img src="http://farm8.staticflickr.com/7410/10839259375_80b4743f6a.jpg" width="500" height="375" alt="Untitled"></a>
