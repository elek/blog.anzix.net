---
layout: post
title: Sun Java System Web Server
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2007/03/sun-java-system-web-server.html
---
"Netbeans 5.5-öm még mindig nem támogatja a Tomcat 6-ot, márpedig kéne egy
Glassfishnél kissebb memória igényűbb JAVAEE 5 Servlet container."

  
Így végződött az előző bejegyzésem, amire commentbe kaptam ötletként a [Sun
Java System Web
Server](http://www.sun.com/software/products/web_srvr/home_web_srvr.xml)-t.
Első látásra rögtön nagyon szimpatikus volt. Régen próbáltam már egyszer, de
akkor csak RHEL-re ment fel, most meg simán vett minden akadályt Ubuntu-n is.

  
Azt szokták mondani, hogy a SJSWS ugyanazt tudja mint az apache-httpd plusz
még néhány mellé felhúzott modul/util együttvéve (pl. logrotate, webdav,
reverse proxy). Van hozzá szép webes felület, command line-os tool, és persze
xml-ből is konfigurálható. Viszi a legacy php alkalmazásokat, és deployolhatok
bele java-t is. (A config felületeinek a kényelmességét jól mutatja, hogy
létezik arra külön parancs, hogy selfsigned certificate-et gyártsunk a
szerverhez. Apachhoz ehhez mindig rá kellett gugliznom egy howto-ra). A
virtual hostokoat is nagyon korrektül kezeli (glassfish-ben pl. ahogy láttam a
v2-ben lesz elég erős ez a funkció).

  
Szóval nagyon jónak tűnt, és a hétvégén úgyis újra húztunk a szerverünket, úgy
hogy ez lett a web container. Részletes tapasztalatokkal majd kicsit később,
valamennyi idő távlatból. Egyelőre nagyon jól muzsikál, bár vannak még
megoldatlan részek (php-ből egyelőre csak a letölthető pluginjét sikerült
beüzemelni, ubuntu-s defaultot nem, 80-as porthoz rootként futtatva az admin
szervert is a config-deploy még nem működik, stb.). De egyelőre még a doksit
se olvastam el, úgy hogy nem panaszkodunk. Jackrabbitot pl. nagyon könnyen
sikerült beconfigurálni.
([így](http://wiki.apache.org/jackrabbit/JackRabbitOnSunWebServer)).

  
Memória fogyasztást még nem néztem. A szerveren minden cakli-pakli foglal 200
megát (java még nincs nagyon deployolva, de legalább 15 virtual szerver fut),
úgy hogy nincs pánik.

  
A dolgot egy kicsit rontja, hogy a fent idézett mondat nem oldódott meg.
Ugyanis a SJSWS 7.0 update 1 Technology Preview, ami tudja a javee5-öt ugyan
kezelhető a NetBeans pluginnel, de egyrészt a NetBeans nem hiszi el róla, hogy
tudja, amit tud (csak 1.4-es projectet enged bele deployolni) másrészt virtual
szervereket rohadtul nem kezel (mármint az NB plugin). Szóval itt még
fényezhető lenne egy kicsit a dolog.

