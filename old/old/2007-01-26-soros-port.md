---
layout: post
title: soros port
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2007/01/soros-port.html
---
Soros portot szernék használni. Lehetőségek:

  
[Java Communications API](http://java.sun.com/products/javacomm/)

Sun-os megoldás, (bár ha jól látom nincs rá JSR, ez csak egy megvalósítás). A
3-as változat csak linuxot és Solarist támogat, a 2-es változatot elvileg
előbányászható, és abban van windows-os is.

  
[RxTx](http://users.frii.com/jarvi/rxtx/)

Mindent eszik: MaxOSX, Linux, Windows, BSD, stb. Nálam egyértelműen ez a
nyerő.

  
[CDC](http://java.sun.com/javame/reference/apis/jsr218/javax/microedition/io/C
ommConnection.html)

PocketPC-re elvileg a CDC-be kell lennie.

  
Az [SMSlib](http://smslib.sourceforge.net/) (soros porton SMS-eket olvasó API)
pl. a sunossal és az rxtx-el is megy. Csupán ANT fordítás előtt ki kell
cserléni egy class elején az import javax.comm-ot gnu.io.*-ra. Vicces
megoldás.

