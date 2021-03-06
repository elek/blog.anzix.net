---
layout: post
title: Google App Engine
tags:
- appengine
- gae
- google
status: publish
type: post
published: true
meta:
  _edit_last: '2'
---
Egyfelől egy elég jó hosting környezet, ugyan korlátozásokkal, de azokkal
együtt lehet élni. Webes felület, áttekintés a használt erőforrásokról,
verziózott deploy, nincs PermGen hiba, stb. Másfelől habár [elég sok
mindent](http://stronglytypedblog.blogspot.com/2009/04/wicket-on-google-app-
engine.html) lehet futtatni rajta, korántsem problémamentes olyan alkalmazást
fejleszteni, amit GAE-be is, és hagyományos webkonténerbe is ugyanúgy lehet
futtatni. Én rögtön a JPA kortlátozásaiba futottam bele. Egyrészt itt is
örörm, hogy szép szabványos felületen adnak a BigTable fölé, még az se nagyon
baj, hogy @ManyToMany-t nem használhatok, és hogy az entitás osztályaimat
precompile-olni kell DataNucleus-szal. De az már sokkal szűkebb
keresztmetszet, hogy ha szülő-gyerek relációt szeretnék, akkor az elsődleges
kulcsnak Stringnek, vagy Google specifikus Key osztálynak [kell
lennie](http://stronglytypedblog.blogspot.com/2009/04/wicket-on-google-app-
engine.html). Egyiket se könnyű egy az egybe átültetni mondjuk Mysql +
Hibernate JPA-ra. Persze tudom, itt nem az a cél, hogy a meglévő alkalmazások
rögtön deployolhatók legyenek a GAE-be, hanem hogy az induló startup-omat
kifejezetten Google-re fejlesztve skálázható teljesítményt kapjak, és azt is
tudom, hogy a BigTable azért nem egy relációs adatbázis. És azt se mondhatom,
hogy nem korrekt Java környezetet kapok hozzá. Csak valahogy jó lett volna,
hogy ha kis ember Java hostingjának is jó lenne az egész. (Pl. ha az XWIKI-be
fejlesztene valaki BigTable perzisztens layert...)

