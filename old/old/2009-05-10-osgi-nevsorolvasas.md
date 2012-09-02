---
layout: post
title: OSGi névsorolvasás
tags: []
status: publish
type: post
published: true
meta:
  _edit_last: '2'
---
[pax-runner](http://paxrunner.ops4j.org/space/Pax+Runner): Az ops4j-sek azok,
ahol nem csak a forráskód a szabad, hanem a fejlesztés is, tehát odamész, és
ha akarsz, commitolsz. Az ő legnépszerűbb projekt csokruk a pax, amik mind
OSGi-al foglalkoznak. A pax-runner pl. OSGi konténert indít el. Bármilyet,
csak paraméterezni kell. Azt is megmondhatod, hogy milyen alap szolgáltatások
legyenek benne. Ha nincs meg a konténer, amit szeretnél, akkor letölti. Nagyon
jól lehet vele tesztelni bundle-t több konténerbe.

  
[modulefusion](http://code.google.com/p/modulefusion/): (K.-tól tanultam.) A
recept egyszerű: végy egy csomó OSGi bundle-t (ha nincs elég jó, csinálj), és
az egészet rakd össze valami alkalmazás szerver jellegű dolognak, és nevezd
el. Ezt csinálja a Spring Source is, és ilyen a modulfusion is. Van benne
wicket, guice, hibernate mindezt pax-runner indítja el, jól összerakott
szakmunka. Példák is vannak, hogy hogy csináljunk JPA+Wicket+guice varázslatot
OSGi konzolon.

  
[equinox](http://www.eclipse.org/equinox/): az Eclipse OSGI konténere. Az
izgalom az benne, hogy van hozzá egy [server
bridge](http://www.eclipse.org/equinox/server/). Ez egy war file, amit
bedeployolsz bárhová, de közben OSGi konténer is. A servletre érkező kéréseket
OSGi HttpService szolgáltatásként adja tovább. Valami ősöreg 3-as OSGi
bundleok vannak benne.

  
[Felix](http://felix.apache.org/site/index.html): Apache OSGi konténer. Kicsi,
könnyű, beágyazható. Akik nem eclipse hívők (pl. Glassfish), azok általában
ezt használják. Szerethető cucc, de nincs servlet bridge-hozzá. (még)

  
Http Service: OSGi kiegészítő specifikáció része. Kicsit buta, csak Servletet
lehet regisztrálni. Azt is úgy, hogy lekéred a servicet, amin meg tudod hívni
a regisztráló metódust. Mindenkinek szokott lenni implementációja, általában
Jetty alapú.

  
Pax-web: egy másik pax. Olyan mint a Http Service (extend), csak van mellette
még filter támogatás is, meg resource és jsp regisztráció, welcome file
támogatás, stb. Servlet bridge nem tudja, mivel ez önmagában egy jettyre épülő
bundle. Kicsit vendor lock-in, de szükség lehet rá (modulefusion a Wicketet
servleten keresztül működteti, nem filteren, tehát megkerülhető).

  
Pax web extender, whiteboard: a http service-ek regisztrációját könyíti meg.
Nem kell megkeresni a szolgáltatást, amin keresztül regisztrálni lehet a
Servletet, hanem elég felírni a táblára, hogy én vagyok X Servlet az Y url-en,
és már megy is. Meglepően okosan összerakott cucc: megy csak Http Service
szolgáltatással, és pax-web-bel is. Megnézi milyen osztályok vannak, és azzal
főz.

  
[Felix File Install](http://felix.apache.org/site/apache-felix-file-
install.html): egy okos bundle, ami sasol egy könyvtárat, és az ott feltünő
bundle-okat hot deployolja.

  
modulefusion dir install: egy mégokosabb bundle, ami a modulfusion része, és
nem csak a bundle-okat nyomja fel, de a config fájlokat is beolvassa.

  
**_Recept_**: fogom a Felix-et, berakom egy szervletbe, és onnan indítom, tehát elértem azt, amit az equinox servlet bridge is. Az OSGi compendium libraryt kicsit megpatkolva, pár class-t az OSGi class loadernek kiajánlva, és a HttpRequest wrappolása után, a pax web whiteboardon keresztül, a felix dir installt mellőzve, hanem az eredeti modulefusion-osat használva, a modulefusionos wicket-es guice-os OSGi-s csoda tökéletesen fut szervlet konténerbe. peace.  
  

![](http://img.zemanta.com/pixy.gif?x-id=c640f7fe-0f98-8275-a44a-01ebbdbb9bae)

