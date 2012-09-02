---
layout: post
title: Elhavazva (TopLink kapcsolók)
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2007/11/elhavazva-toplink-kapcsolk.html
---
(Lassan már álmomban is implementálok, de van remény, nem sokára enyhűlni fog
a helyzet. És akkor majd...)

  
[Itt](http://www.oracle.com/technology/products/ias/toplink/jpa/resources
/toplink-jpa-extensions.html) viszont egy remek összefoglaló a Toplink JPA
suttyom kapcsolóiról. Persze egy része Oracle specifikus, olyan annotációkat
meg mégsem akarhatunk látni tiszta JPA forrásban, de egy másik rész pedig szép
kiterjesztés, ami kifejezetten belefér a JPA-ba. Pl. vannak plusz propertyk a
persistence.xml-be, amik kiloggolják az SQL lekéréseket, vagy hogy induláskor
nem az adatbázisba rakja újra a táblákat, hanem elmenti a CREATE SQL
parancsokat egy DLL szkriptbe bárhová.

  
Ha minden jól megy, most úgy is alkalmam lesz mélyebben megismerni a TopLink
lelkivilágát.

