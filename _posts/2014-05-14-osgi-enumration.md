---
title: OSGi névsorolvasás
tag:
   - java
   - osgi
   - karaf
   - fuse
layout: post
type: dpc
---

A hőskorban létezett egy magyar nyelvű wikioldal jhacks néven, amit még [Kocka][kocka] szerkesztett. Itt szintem minden Java-val kapcsolatos technológiáról volt egy két bekezdés, ami elmondta, hogy mi az. A wiki azóta már eltűnt az idők homályában, egy nem frissülő snapshot változata nem rég óta olvasható egy [github-os archívumban][jhacks].

Most amikor OSGi alapú technológiákról és termékekről akarok majd több posztot is írni ez a wiki jutott eszembe. Jól jönne ugyanis némi rövid magyarázat, hogy az elkövetkezők során jobban érthető legyen, melyik komponens micsoda és mi a szerepe.

Ez a poszt tehát egy rövid felsorolás lesz, seregszemléje, néhány OSGi-os toolnak.

*OSGi*: Az OSGi a hiányzó modularizáció a JDK-hoz. Tud classpath szeparációt, dinamikus újraindítást, servicek és függőségek kezelését. Távolról nézve (leegyszerűsítve) sok jar file futtatása egy egyszerű konténerben ahol nagyon jól szabályozva van, hogy hogy láthatják egymást és egymás service-eit a jar-ok. A jar-okban van a META-INF/MANIFEST.MF-ben minden féle OSGi specifikus metaadat. Emiatt nem földhözragadt jar fileoknak fogjuk hívni őket, hanem magasztos OSGi bundleoknak. Pedig csak jarok.

*Apache Felix*: OSGi-hoz tehát kell egy konténer, ami intézi a szabványos életciklust, láthatóságot, stb. Ezek közül két népszerű darab az [Apache Felix][felix] és az [Eclipse Equinox][equinox]. Igazából előbb utóbb úgy is kiderül, hogy nem a konténer a lényeg, hanem, hogy milyen alap funkcionalitás van még benne.

*Apache Karaf*: Ha az extrák számítanak, akkor működik az is, hogy fogjuk a Felixet, mellérakunk extrákat, és úgy terjesztjük. Ez a Karaf. Nagyon nem ritka dolgok amit nyújt: ügyesen kitalált deploy, config management, logging, deployment stb. Sok dolgot ráadásul külön fejlesztenek (pl. pax-os projektek), csak itt szépen összerakva lehet elindítani. Egész szerethető jól működő dolog.

*Apache ServiceMix*: A szépemlékű Java Business Integrationt (JSR 208) is implementáló ESB megoldás. Van benne egy JBI kompatibilis Normalized Message Bus, és sok adapter. A jelentősége mára már igen lecsökkent. Egyrészt az Apache Camel-ben már sokkal több adapter van, másrészt a JBI specifikáció meg úgy tűnik nem váltotta meg a világot és lassan eltűnik. A ServiceMix attól még itt van velünk együtt. Főleg azért mert egy pillanatban ugrott egy nagyot és a ServiceMix nevű doboz átváltozott egy Karaf + néhány okos dolog (CXF, activeMQ, stb.) terjesztésévé egy Karaf konténerben. Innentől már szinte mindegy is, hogy az eredeti service bus-ból mennyi maradt benne fontos, ha egy jól összerakott Karaf alapú alkalmazás platformot ad.

*Apache Camel*: Az un. Enterprise Integration Patterneket megvalósító integration megoldás. Kb. úgy kell elképzelni, hogy van benne egyrészt rengeteg adapter, másrészt jó néhány api, amivel a sok adapter közötti üzenet áramlást lehet szabályozni (üzenetek transzformációja, szétszedése, összeszedése, elágazást, stb.). Szép fluid API-val működik, de van jó Springes és blueprint támogatása is.

*Jboss Fuse*: Ha már ennyit érnek az extrák, lehet még fokozni: fogjunk egy Karaf-ot (Felix + extrák) rakjunk mellé még Camel-t meg ServiceMix-et meg mondjuk egy Zookeper alapú clusteres config managementet és dobozoljuk be. Ez a Fuse, amit a a JBoss kb. 2 éve megvett magának. Az új opensource változat [fabric8.io][fabricio] néven fut. A levelező listája alapján tetszhalott, de csak azért mert minden fejlesztő IRC-n lóg és ott beszélgetnek. A fabric a fuse legnagyobb hozzáadott értéke, a clusteres varázslat zookeper alapokon, pont jó lett elnevezni az open source változatot.

*Camunda*: Kicsit kilóg a sorból, mert ő egy beágyazható BPMN workflow motor. Be táplálunk egy BPMN grafikont és szépen megcsinálja a lépéseket sorrendben. Kb. 1 éve forkolta a Camunda nevű konzultáns cég az Activityből (akiknek meg az azóta is létező jBpmn a nagypapájuk). OSGi-t hivatalosan nem támogat, de nem hivatalosan persze remekül megy. Mivel a workflow motor csak a magas szintű processért felel, pont jól kiegészíti mondjuk egy camel, aki az adaptereket és transzformációkat alapból tudja nyújtani.

A fő szereplők ők. De ahogy írtam még új és új mellékszereplők jutottak eszembe, ők viszont majd csak későbbi epizódban fognak előbukkanni. Maradjanak velünk.


[kocka]: http://iwillworkforfood.blogspot.hu/
[felix]: http://felix.apache.org/
[equinox]: http://www.eclipse.org/equinox/
[fabricio]: http://fabric8.io/
[jhacks]: http://elek.github.io/jhacks/
