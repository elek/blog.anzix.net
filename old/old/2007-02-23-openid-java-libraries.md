---
layout: post
title: OpenID java libraries
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2007/02/openid-java-libraries.html
---
Kocka kérésére :)

  
Az [OpenID.net](http://www.openid.net) három java libraryról
[tud](http://openid.net/wiki/index.php/Libraries).

  
[IdPrism](http://www.idprism.org/): Jelenleg én ezzel kísérleteztek, mert ez a
legegyszerűbb. OpenID 1.1-et tud, azt viszint ajaxon keresztül is. A letöltött
könyvtár tartalmaz egy példa servletet is, ahol mind az ajaxos mind a szerver
oldali megoldásra látunk egy egyszerű példát. A kód nem egy nagy durranás, de
legaláb könnyen át lehet látni.

  
[OpenID4Java](http://code.sxip.com/openid4java/) OpenID 2.0-sat is támogat,
jól néz ki, ez lesz a következő, amit kipróbálok.

  
[NetMesh InfoGrid LID Java](http://lid.netmesh.org/wiki/Main_Page). A
legnagyobb baj vele, hogy ez alapvetően LID implementáció. Mivel a LID speckó
része, hogy OpenID-ül is kell tudnia, ezért valahol benne van az OpenID
támogatás.

  
LID meg egyelőre megfigyelés alatt. Annyit csak, hogy próbáljuk meg megkeresni
az OpenID.net oldalon a letölthető speckót, és a rá vonatkozó licenset, és
ugyanezt a LID oldalon. Na ugye. Tegnap írtam egy levelet a LID community
levlistájára (az archívum nagyon gyér forgalmat mutatott, de hátha). Az első
meglepetés, hogy a lista moderált (szóval ennyit a communityről). Aztán
jóváhagyás helyett megkaptam emailben a speckókat, amik
[CC](http://creativecommons.org/licenses/by-sa/2.0/) licensz alatt érhetőek
el. De egyelőre maradok az OpenID 2.0-hoz való felzárkózásnál.

