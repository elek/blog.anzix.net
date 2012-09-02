---
layout: post
title: Glassfish + PHP + Drupal
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2006/11/glassfish-php-drupal.html
---
Hogy miért? pl. legacy php-s alkalmazásunk is van, de szeretnénk melette
ugyanazon a szerveren (és lehetőleg ugyanúgy 80-as porton) a java-s örömöket
is futtatni.

  
A helyzet nem túl bonyolult még glassfish-ben sem, ahogyan ebben [fórumban](ht
tp://forums.java.net/jive/thread.jspa?threadID=2588&messageID=158550) is
írják. Le kell tölteni [PHP/Java](http://php-java-bridge.sourceforge.net/)
Bridge binárisát (war file). Kísérlet képpen deployolhatjuk is rögtön, és
(nekem a JSF integráció kivételével) rögtön ment is minden demo szépen
(session megosztás, php-ból java hívás, stb.).

  
Saját webalkalmazás sem volt bonyolultabb. Kísérletképpen, hogy egy echo
"asd"; nél bonyolultabb alkalmazást vegyek a [Drupal](http://drupal.org/)
rendszert akartam látni működni.

  
1. Csináltam egy web alkalmazást

2. a JavaBridge.war-ból átmásoltam a web.xml-t (lényege, hogy a *.php-re a
saját szervletét meppeli be).

3. a /WEB-INF/lib-ből a php-servlet.jar és a JavaBridge.jar-t hoztam át

4. feltelepítettem a php5-cgi csomagot (demo deployolásakor még nem volt fent!
mivel a demo önmagában tartalmaz a WEB-INF/cgi-ben php binárist is)

5. bele a gyökérbe a php fájlokat

6. deploy, és minden szép

  
Persze még lehetne további dolgokkal kísérletezni. A szemem sarkából láttam,
hogy elég komolyan lehet egymásba integrálni a kettőt (pl. az egyik demo
java-s excell api-t használt php-ből.) Meg ki kéne valahogy mérni a sebességet
is.

  
De kezdetnek elég lesz ez: könnyű sikerélmény.

