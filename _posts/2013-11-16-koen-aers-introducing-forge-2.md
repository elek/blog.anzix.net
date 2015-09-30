---
layout: post
title: "Koen Aers: Introducing Forge 2"
date: 2013-11-16 19:27
tags: 
   - devoxx
   - forge
   - jbosstools
type: dpc
---
A Devoxxon az ebédszünetek egy óráig tartottak, de még ez alatt az idő alatt is mentek az előadások. Ezek voltak az úgynevezett *Quicke*-k: rövid, negyedórás előadások, épp csak felvillantottak egy témát. Ezekre a helyekre amúgy lehetett pályázni (volt *Call For Papers*) és talán ezért egy kicsit vegyesebb is volt a felhozatal.

A Forge 2-ről szóló pont egy említésre méltó volt, tömör, tisztességesen összeszedett demó.  A [Forge](http://forge.jboss.org) a jboss scaffolding toolja, azaz arra hivatott, hogy létrehozzon tipikus minta projektet választható összetevőkkel és komponensekkel. Működik command line is és az Eclipse-es jbosstools részeként is, de ez utóbbi se sokkal több mint egy ablakban futó command line eszköznél.

Illetve eddig nem volt több. A 2-es verzióban viszont már gui-s támogatás is van. A scaffolding tool tetszőleges pluginjei most már ha megfelelő apit használnak úgy tudják definiálni az elérhető paramétereiket, hogy abból szép IDE varázsló is megjeleníthető, és természetesen a command line-os programban pedig működik az automatikus parancskiegészítés. Erről szólt a negyed óra.

Más kérdés, hogy szükségünk van-e egyáltalán scaffolding toolokra, vagy minden projekt olyan egyedi lesz idővel, hogy úgy se érdemes sablonokat használni.

Erre a kérdésre sok válasz létezik, de az idő -- ahogy arra tanult kollegám rámutatott -- a scaffolding tooloknak kedvez. Egyre újabb és újabb keretrendszerek jönnek, és minél több fa az erdőben, annál jobban jön egy térkép. A [Yeoman](http://yeoman.io), például, aminek egy része a scaffolding, Javascriptes világban egész szép népszerűséget kezd elérni, tehát az igény úgy látszik megvan.

De persze vannak más utak is. Az angularjs egy minta projektet tart karban [angular-seed](https://github.com/angular/angular-seed) néven, ott elég azt leklónozni és már is megvan az alap projektünk. A maven pedig ugye az archetype plugint adja, ami minta projektet tud generálni, de klasszikus scaffoldingot (pl. entitásokhoz további komponenseket, pl. REST végpontot generálni, stb.) nem tud. De még így is sokkal több ez, mint amit a Gradle ad, ahol teljesen hiányzik ez a funkcionalitás.

Most viszont kezdek arra hajlani, hogy ha már szükség van ilyen eszközre, akkor az legyen build tooltól független, de jól összerakott eszköz. (Ehm, mivel jelenleg a Gradle az, amire szavazok, muszáj ezt képviselnem). És ha már külső eszköz, a Forge (főleg a jövőbeni 2-es verziója) meglehetősen pofásnak tűnt. 

A jelenlegi változatnak (1.4) amit letöltöttem még voltak sorjás részek. Például mennyire jó lenne, ha a kontextust nem kéne a Forge console-ból beállítanom, hanem az aktuálisan megnyitott Java osztály lenne az. Pl. megnyitok egy Java osztályt, megmondom, hogy loggert ide, és meg is kapnám. A loggert IDE templatekkel ugyan meg lehetne oldani, de ez egyrészt tudna IDE független lenni, másrészt komplexebb műveleteket is el tud végezni (létrehoz egy osztályt és be is regisztrálja egy XML leíróban).

A 2-es verzió viszont elég ígéretes.

