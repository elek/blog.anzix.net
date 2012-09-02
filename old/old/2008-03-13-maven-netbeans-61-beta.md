---
layout: post
title: Maven + Netbeans (6.1 Beta)
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2008/03/maven-netbeans-61-beta.html
---
Maven kellett éppen, gondoltam majd a Netbeans-ben, és automatikuasan a
Netbeans 6.1 beta-t indítottam. A plugin benne is volt a hivatalos plugin
repo-ban, de a telepítés után elég kiábrándító volt. Olyan alap dolgok nem
működtek mint pl. az importok automatikus rendbeszedése, arról nem is szólva,
hogy a Web-es Maven projekt semmit sem tudott deployolásról vagy web.xml
szerkesztésről. Gondoltam is, hogy erről ennyit.

  
Azért biztos ami biztos kipróbáltam 6.0-val is. Ugyanúgy felugrott, de láss
csodát, egész más élmény. Importok működnek pöccre, minde szép és jó, sőt a
beépített Tomcat-be és Glassfishbe is zokszó nélkül deployolt. Egész
használható volt az egész. Ott volt csak kis szébséghiba, aminek nem értem a
nyomára, hogy a checkstyle pluginnek Netbeansben teljesen más verziója (asszem
2.0-beta6) jött le mint command line mvn-nel (2.1). És persze más default
beállításokkal dolgozik a kettő.

  
A nagy örömre jutalmul ki is próbáltam Kocka Flex-es RPC-s
[prototípusát](http://iwillworkforfood.blogspot.com/2008/03/flash-
kommunikcija-egy-backenddel-amf.html), és persze ment szépen, bár a kódban még
nem volt időm elmélyülni.

