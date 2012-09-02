---
layout: post
title: OSGi első lépések
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2008/04/osgi-els-lpsek.html
  _edit_last: '2'
---
A hétvégén volt egy rövid köröm az OSGi-vel. A tapasztalatok címszavakban.

  
Az apache [Felix](http://felix.apache.org/) OSGi konténerével kezdtem, pöccre
indul, kicsi, gyors.

  
Szintén a Felix Maven pluginjével buildeltem az OSGi Bundleket (=modulokat), a
plugin igazából csak a Manifest-et tölti ki az OSGi specifikus adatokkal. Nem
volt vele különös szívás.

  
Azt viszont nem sikerült megvalósítani, hogy legyen valami olyan run plugin,
ami buildelés után rögtön bedeployolja és futtatja egy futó OSGi rendszerbe a
lefordított modult.

  
Rátaláltam viszont a [Pax-
Runner](http://wiki.ops4j.org/confluence/display/ops4j/Pax+Runner)-re. Ami
szintén egy kicsi és könnyen használható tool OSGi konténer és benne egy modul
indítására. Paraméterezhető, hogy melyik konténert indítsa (Felix, Equinox,
Knopflerfish, első alkalmmal letölti azt, ami kell), továbbá, hogy honnan
vegye a modult, amit indítani kell benne (polloz könyvtárat, leszed modult
OSGi repoból, vagy akár Maven repóból). Én ez utóbbit használtam. Installoztam
a Maven projectet, majd

  
_pax-runner mvn:net.anzix.osgi/helloworld

  
_Sajnos következő futtatáskor a pax-runner cache-t üríteni kell, hogy újra a
Maven repository-ból töltse le az aktuális modult.

