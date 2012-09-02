---
layout: post
title: Glassfish v3 és Weblogic
tags: []
status: draft
type: post
published: false
meta:
  _edit_last: '2'
---
Van új Glassfish, és rögtön jól fel is húztam magam ezen a reklám <a href="http://www.adam-bien.com/roller/abien/entry/glassfish_v3_the_killer_java">poszton</a>. Talán mert már előtte már túl sok pilpult olvastam a levlistákon, ami önmagában is jól elfárasztott, vagy talán csak azért mert egy ilyen Java Rockstart Champion Enterprise Book Author-tól kicsit precízebb leírást vártam. Állítólag ez a Glassfish top ten feature

1. <strong>Easy installation</strong>: Hát igen, ez alap. Szerencsére a weblogicot felrakni is ugyanolyan egyszerű (ellentétben néhány más Oracle termékkel, aminek már a telepítéséhez is mágia kell). Weblogic telepítője kifejezetten baráti, a next,next,finisht el lehet játszani konzolból és GUIból is és szkriptből is (ha van GUI észreveszi és azt indítja, külöben GUI). A domaint létrehozó felület ugyanilyen barátságos. Pipák, értelmes defaultok, stb.

2. <strong>Built-in monitorint capabilities</strong>. Na ne mondja! Melyik alkalmazás szerverről nem mondható mindez el? Weblogicban nem mellesleg jpython konzolból is bütykülhetjük a JMX MBean-eket (és természetesen szkriptből is). Van továbbá elég jó diagnostic támogatás is. Pl. meg lehet mondani az üzemeltetőnek, hogy nyomja meg a nagy állapotmentés gombot, és küldje el a kidobott infókat, és abban a thread dump-tól kezdve mindent meg lehet találni. Az MBean-ek SNMP-n keresztül is kiajánlhatóak, amikre szintén az üzemeltetől szája szokott felderülni. (Ha jól olvastam SNMP támogatás a Glassfishban is van).

4. <strong>Administration</strong>. Igen egy modern alkalmazás szervernek van admin felülete, megint nem mondott semmi újat. A Weblogic ahogy írtam, emellett még (J)Pythonból is adminisztrálható. Még úgy is, hogy be lehet kapcsolni hogy python szkriptbe rögzítse a változtatásokat és máskor is le lehet játszani (persze korlátok vannak, pl. a security rendszer táján ez nem megy).

5. <strong>Developer friendliness</strong>. Az ide integráció konkrétan nem hat meg, ha nem lehet konzolból/hudsonból deployolni, akkor nem veszem meg. Az embedded mód viszont tényleg fény, az első pont, amire valóban elismerően lehet bólogatni. A glassfish:run a jetty:run-hoz hasonlóan futtatható mavenből, és ha tényleg segít JUnit integrációs teszteket deploy nélkül véghez vinni, akkor ez már egy erős érv.. A Weblogic semmi ilyet nem tud, ott az alkalmazásod, és ha valahová bebetonoztuk, onnan elindul.

6. <strong>Lightweight nature: </strong>Igen, végre még egy pont. A Weblogic telepítésem JDeveloper nélkül is már nyaldossa az 1G-t, a friss Glassifish még csak 200Mb. A Glassfish üresen olyan 70M memórián lebegett (A mvn jetty:run olyan 20-30M-en el volt a db4o-s projektem felett). Az is igaz, hogy a Weblogic funkcionalitásban azért többet ad, van benne pl. SAML1,2 provieder és automatikus identitás propagáció, nyilván ezek kerülnek valamibe. Meg az is igaz, hogy a mai HDD árak mellett azért nem néhány száz Mbyte lesz a döntő.

7. <strong>Performance / Scalability: </strong>Ok, a régi gyors volt, az újat meg még nem mérte senki. Weblogicot meg én nem mértem, de nem volt vele panasz, és azt hiszem hogy a NIO se olyan forradalmi már (Jetty biztosan, a Weblogic csak rémlik hogy szintén azt használ). Nem túl informatív pont.

8.<strong> Bleeding edge: </strong>A cím itt is blikkfangos. A script nyelvek támogatását jónak tartom, Kár hogy a PHP-t például csak manuálisan Quercus-on keresztül támogatja (quercusszal más alkalmazás szerverekbe  is megy a PHP). A HK2 meg szerintem annyira nem bleeding edge.

9. <strong>Hype compliance: </strong>Ennek már az indoklása is vicces, én azonban örülök, hogy OSGi alapú lett. Az updatetool nekem lehozott egy olyan service-t, ami neve alapján azt ígéri talán, hogy standard OSGi webes szolgáltatásokat is tudna nyujtani a bundle-k számára, és ez valóban meggyőző lenne, hogy ha egy konténerbe tudnék deployolni webes OSGi budle-t és WAR fileokat is.

<strong><span style="font-weight: normal">10.</span><strong> Standard compliance: </strong><span style="font-weight: normal">Hát igen, azt hiszem, hogy számolhatjuk a hónapokat, ameddig a többiek felzárkóznak. És nem csak magáról a Java EE 6 támogatáról van szól, hanem pl. friss Jax-WS stackről, ami a Weblogicban is jól jönne.</span></strong>

Na de megint csak kukacoskodom.
