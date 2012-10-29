---
title: Jaxws tubes
layout: post
tags: jaxws, soap, soap handler, tubes
---

A Soap


Alapvetően két helyen tudok SoapHandler-t definálni:

1. A jaxws.xml-ben, service-enként.

2. A service osztályon lévő annotációval annotáción.

3. Kliens oldalon programatikusan.

Ebben a minta projektben mindegyikre van példa:

A probléma mindkettővel ugyanaz: egy adott handlert minden szolgáltatásra külön be kell kapcsolni, és nincs lehetőség arra, hogy definiáljunk egy alapértelmezett handler készletet. Ha a handlerünk valami kötelező lépést implementál egy folyamatban (pl. autentikáció), nagyon veszélyes abban bízni, hogy sose lesz a handler elfelejtve. Ilyen esetben olyan megoldás kell, amit automatikus.

A Sun féle JAXWS implementáció (Metro) forráskódját megnézve hamar kiderül, hogy SoapHandler szinten nincs erre jó megoldás, mivel mindenhol final és private megoldásokban ütközünk (az én ízlésem szerint sok helyen indokolatlanul.)

Viszont van egy kevéssé ismert Metro specifikus megoldás a Tubeline-ok használata. Ezt úgy kell elképzelni mint a servlet filtereket, csak itt a JAXWS szerver és kliens kérések folyamatai közé tudunk berakni újabb lépéseket.

Hátrányok:
* Metro függő (és verzónként máshogy kell konfigurálni).

Előnyük:
* Transzparens: automatikusan bekapcsolható új elem minden kliensre vagy minden szolgáltatásra.
* Nem csak a SOAPMessage, hanem egyéb információk is (A végpont neve, WSDL definíció) elérhető.

A használatáról olvasható egy cikk [itt](http://marek.potociar.net/2009/10/19/custom-metro-tube-interceptor/), de ez az előző verzíóra vonatkozik. Aktuálisan nem kell XML filet használni, csak egy [Service Provider Interface](http://docs.oracle.com/javase/tutorial/sound/SPI-intro.html) filet, a megfelelő implementációval.

Kell tehát egy file a alatt

Kell egy factory

Kell

Míg végül a saját implementációnk.

Relatív elegáns, de gyártó függő megoldás a JAXWS specifikáció egy fájó hiányára.
