---
layout: post
title: "Jean-francois Denise: Avatar.js"
date: 2013-11-15 17:19
tags: 
   - devoxx
   - nodejs
   - avatarjs
   - javascript
type: dpc
---
Az Avatar.JS nyílttá tételét ha jól emlékszem az idei Java One-on jelentették be. 

Amíg a Vert.x a Node.JS-ből tanult dolgok alapján csinált egy hasonló szellemiségű, de okosan kitalált Java-s eszközt, az Avatar.js nem más mint egy Node.JS futtató környezet Java-ban a Java8-ban megjelenő új javascipt motorra a Nashornra építve. A cél a 100% kompatibilitás. Jelenleg a v0.10.08 a cél, és a (Node.JS) unit tesztek 80%-a már lefut (némelyik kis módosítással). Persze ez a szigorú megfelelni akarás áldozatokat követel. Például a Java NIO (a Vert.x-ben az ezt használó netty van) helyett a libuv-t (amint a Node.JS is használ) rakják bele JNI (!!)-n keresztül, azaz nem tisztán Java, hanem van natív része is. A sebessége pedig sokkal lassabb (nincs pontos mérés, de nagyságrendileg 2x-3x) mint a natív Node.JS.

Miért használná akkor bárki? Az ajánlat szerint azért, mert itt meg lehet hívni a Java világ összes library-jét. Az old-school szinkron dolgoknak, amiket nem akarunk meghívni a villám gyors kéréseket feldolgozó száltól szeparált külön Executor van. A demó alkalmazásban pl. Java libraryk végezték a képfeldolgozást egy külön szálon, és ha kész volt, akkor visszahívott az avatar.js feldolgozó száljába, ami a javascript feldolgozást végezte. Ez az integráció kiforrottabbnak tűnt, mint a Vert.x-é, bár az is lehet, hogy erről pont nem volt slide a másik prezentációba. Emellett még a Java Security Model-el próbálják a Node.JS felhasználókat csábítani, itt szépen mindenhol végigvezették, és a Java Security beállításokkal le lehet korlátozni a futtatott javascript lehetőségeit.

Mindezek mellett dolgoznak még egy AvatarEE megoldáson (ahol az egészet belerakják Java EE környezetbe/app szerverbe), valamint az npm-nek (gyk. nodejs csomagkezelő) megfelelő apm-en. Ez utóbbi még nem nyílt forráskódú. A kérdések között valaki megkérdezte, hogy mikor lesz. Az előadó azt válaszolta, hogy fogalma sincs (!!!).

Van tehát az egyik oldalon egy ügyes aszinkronitásra épülő, multi-language (Java, JS, JRuby, JPython,...) keretrendszer, clusterezhetőséggel (by Hazelcast), ügyes event bus implementációval, jó command line támogatással. Ez a Vert.x. Ezzel szemben áll az Avatar.js ami majd egyszer teljesen Node.JS kompatibilis lesz, majd egyszer talán majd gyors is, tartalmaz natív részt, de lehet benne Java Security mondásokat mondani.

Ez eddig szerintem egyértelműen a Vert.x felé mutat, de ne legyünk igazságtalanok: az Avatar.JS még csak most indult. Talán csak némi idő kell a lemaradás behozására, és talán majd akkor a választ is meg kapjuk arra, hogy melyik része mikor lesz szabadon elérhető...
