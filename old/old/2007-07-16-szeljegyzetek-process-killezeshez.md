---
layout: post
title: Széljegyzetek process killezéshez
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2007/07/szljegyzetek-process-killezshez.html
---
Még a múlt hétvégéről maradt itt egy cetli, amin két dolog áll:

  
Egyrészt a [Runtime.getInstance().addShutdownHook()](http://java.sun.com/j2se/
1.4.2/docs/api/java/lang/Runtime.html#addShutdownHook(java.lang.Thread)) Ami
egy elindítatlan szállat ad a JVM-nek, hogy amikor meggyilkolja valaki a
programunkat, a JVM becsukása előtt még lefutassa a szálunkat. (ctrl+c vagy
kill esetén még lefut, de kill -9 esetén persze nem). Nagyon szép lehetőség
fusizásra, és nyilván szép megoldásokra is.

  
A másik, hogy kill -3 parancsra a Sun (gyanítom, ez nincs specifikálva
általánosan) JVM kiadja a futó java thread-ek stack trace-ét. Szegény ember
JConsol-ja. Valamikor még hasznos lehet.

