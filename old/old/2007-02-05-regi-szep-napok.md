---
layout: post
title: régi szép napok
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2007/02/rgi-szp-napok.html
---
Van egy jar könyvtáram (illetve nem az enyém, csak szereztem), szép 1.5-ben
megvalósítva (enum, generic, template). Van egy CDC-res szánt alkalmazásom,
amit IBM J9-el akarok PocketPC-n futtatni (helyből -source 1.4).

  
Az egyik megoldásnak a [retroweaver](http://retroweaver.sourceforge.net/)-t
találtam, amit a lefordított class-okat machinálja át 1.4-es alatt is
futathatóvá. Ant taskként működik, kipróbáltam, és működött. Szép. (Persze
csak akkor , hogy ha nem használunk csak 1.5 api-jában lévő dolgokat).

  
A másik megoldás (és sajnos ez lett belőle), hogy kézzel nekiállok gyomlálni,
és átírni a dolgokat. Sajnos ez lett belőle, mert kiderült, hogy a CDC/Basic
Profile-bül hiányzik néhány awt.geom.*, amit a könyvtár használt, de kellett,
úgy hogy úgy is át kellett alakítani.

  
Viszonylag kis api, de akkor is elég gépies volt visszaalakítani. Egy életre
megtanultam, hogy mennyivel szebb 1.5-ben programozni. Sorban butítottam
vissza mindent, az enumoktól kezdve az Autoboxingig, sok castolás a generic
helyett. Brr...

