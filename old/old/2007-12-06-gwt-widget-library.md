---
layout: post
title: GWT widget library
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2007/12/gwt-widget-library.html
---
A GWT-hez keresek csilli-villi Widget készletet, ami könnyen kezelhető, és
főleg nagyon szép, úgy hogy ha a megrendelő megnézi higyje azt, hogy valami
nagyon profi oldalt lát.

  
Első körben a [MyGWT](http://mygwt.net/)-re és a [GWT-
EXT](http://code.google.com/p/gwt-ext/)-re találtam rá. A demója mindkettőnek
([mygwt](http://mygwt.net/deploy/mygwt-0.4.2/explorer/), [gwt-ext](http://gwt-
ext.googlecode.com/svn/trunk/site/samples/Showcase/Showcase.html#loginDialog))
nagyon hasonló. Gugli barátunk viszont azt mondta, hogy a gwt-ext csak egy
wrapper csomag, ami natív hívásokkal az ext.js nevű függvénykönyvtárat
hívogatja, a MyGWT viszont full Java-ban implementált (és GWT-vel js-re
fordított) csoda. Ráadásul a MyGWT-ben vannak olyan containerek (pl.
WidgetContainer), amik a Swing-ben megszokott Layout-okat is tudják kezelni,
és ezek alapvatően sima Widget leszármazotta, úgy hogy elvileg sima GWT kóddal
is jól integrálhatóak.

  
Szóval egyelőre MyGWT-re áll a zászló, megpróbálom integrálni, és megáltom mi
lesz belőle.

