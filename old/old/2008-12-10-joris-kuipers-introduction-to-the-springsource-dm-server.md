---
layout: post
title: ! 'Joris Kuipers: Introduction to the SpringSource dm Server'
tags:
- Devoxx
- osgi
- server
- spring
- springdm
- tomcat
status: publish
type: post
published: true
meta:
  _edit_last: '2'
---
A Spring "alkalmazás szerver"ének bemutatása. Az alkalmazás szerver egyik
oldalról egy Tomcat felturbózva OSGi-val, a másik oldalról egy Equinox OSGi
konténer, amiben Tomcat is van.

  
Ez első kérdés az volt, hogy miért csináltak új szervert, miért nem voltak jók
az eddigiek (itt nagyon jegyzeteltem, mert ez sosem volt teljesen világos).
Válasz: mert a létezők nem elég modulárisok. Egy deploynál az egész
alkalmazást kell redeployolni, és az alkalmazások között sincs megoldva a
közös szolgáltatások megosztása. A szerver felépítése sem moduláris, ha nem
akarunk mindent használni a J2EE szolgáltatásaiból akkor is mindent el indít
(khm. Glassfish v3 már nem).

  
És akkor az ő megoldásuk: egy Equinox OSGi konténer, ami war-filet is és egy
saját OSGi alapú formátumot is felismer. Alapértelmezésben autodeploy könyvtár
útján (itt pickup), de van admin felület is, ahonnal deployolni lehet. A saját
kváziwar formátumuk is OSGi szabvány család része lesz valamilyen RFC néven.

  
A demók alapján ez a formátum csak azt jelenti, hogy egy plusz spring
könyvtárba vannak Spring xml varázslatok a jar fileban (és annotációk a
kódban), és ezek leegyszerűsítik az OSGi service-ek használatát és
publikálását.

  
Eszközök: van hozzá Eclipse plugin, mást nem is akarnak fejleszteni.

  
Jó dolgok még: van hozzá repository alkalmazás (1.0.1), ami Maven és IvY
kompatibilist, és lehet bundleokat közvetlen a netről repositoryból
deployolni. A logolás is okos: bundle szintű logfájlok vannak.

  
Bevallom én elég szkeptikusan álltam hozzá az elején, mégis tetszett a dolog,
pazar cuccnak tűnt.

Volna.

Ugyanis a végén kiderült, hogy ez az egész csak Equinox konténer alatt fut
(azt tudták jól meghekkelni), mást OSGi konténer alatt nem. Tehát ha írok
valami csodát, akkor azt csak az ő szoftverükön futtathatom. Egy kicsit
meggyőzőbb lenne, ha tényleg nagy OSGi kompatibilitás lenne. Bár lehet, hogy
csak én nem értettem valamit, és az csomagformátum RFC segít majd ezen is.

