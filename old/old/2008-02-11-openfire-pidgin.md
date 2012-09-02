---
layout: post
title: Openfire + Pidgin
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2008/02/openfire-pidgin.html
---
The solution: Use only the first part of your domain in the Domain field
(Basic tab) eg. domain and the fully qualified domain name in the Connect
Server field (Advanced tab) eg. domain.com.

  
Ez a fenti csak azok kedvéért, akik a gugliból jönnek a kulcsszóra. Csak, hogy
ők se csalódjanak. Egyénként az
[Openfire](http://www.jivesoftware.com/products/openfire/) nagyon kezes Jabber
szerver. Letölt, elindít, és megy. (Csak arra kell vigyázni, hogy ha 8080-as
porton valaki figyel, akkor a defaultból bekapcsolt HTTP bind-del összeakad).
Van hozzá enterprise is, de az Open Source változat is mindent tud. Van hozzá
szép webes admin felület is, kattintgatós.

  
Sajnos a Pidginnek egy kicsit imádkoni kellett, hogy menjen vele (lásd felül),
nem volt időm még tetten érni, de vagy a Pidgin, vagy az Openfire valamelyik
hash (talán MD5?) implementációja különbözik.

