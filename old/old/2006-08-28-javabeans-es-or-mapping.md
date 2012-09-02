---
layout: post
title: JavaBeans és O/R mapping
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2006/08/javabeans-s-or-mapping.html
---
Ülök az ablak mellet és a tájat nézem. A JavaBeans-eken elmélkedem.

  
Egy kevéssé típusos nyelvben olyat is láttunk már hogy lekérdezés előtt az sql
query-t keresztül eregették néhány kiterjesztő modulon valamilyen hook
rendszer segítségével, és mindegyik modul átformálta úgy a lekérdezést, ahogy
ő szerette volna (pl. hozzácsapott valamit). A választ meg majd szintén
keresztül eregették a hook systemen, és minden modul szemezgetett belőle, és felhasználta az eredményben a kapott plusz mezőket.

  
Ez eddig nem nagy szám. Javaban is meg lehet ezt csinálni. Mondjuk én szívem
szerint kipróbálnám, hogy nem a query String referenciáját küldeném át (ez a
String viselkedése miatt nem is lenne annyira jó) hanem csinálnék egy Query
osztályt, amihez tagfüggvényekkel tudnék hozzáadni plusz WHERE, ORDER BY stb.
feltételeket.

  
Aztán megkapnám az eredményt. Ez is száll ágról ágra, és minden modul ki tudná
venni pl. res.getString("plusz mező")-vel plusz oszlopokat a ResultSet-ből,
amiket az sql módosításával ő biztosított magának.

  
A probléma ott van, hogy múltkor elkezdtem O/R mapping-gel kísérletezni, és az
első egyszerű példák valóban nagyon kellemesen kézbe símultak. Csakhogy O/R
mapping-gel az adatbázis válasz struktúráját beledrótozzuk a bean osztály
szerkezetébe, amit nem fogunk tudni sehogy sem kiterjeszteni (a leszármaztatás
már rögtön a több modulnál elvérzik, de az interface implementálás sem járható
út).

  
Őszintén szólva nem ismerem ilyen mélyen az O/R mapping megoldásokat, hogy
erre milyen megoldásokat ismer. Két dolog kéne

1. egyrészt, hogy a lekérdezéskor ki lehessen terjeszteni az (?)SQL lekérést plusz WHERE, JOIN stb. feltételekkel  

2. és az így kapott plusz mezőket valahol visszaadja Pl. visszaadhatna egy bean helyett egy bean tömböt (legyen mondjuk Map). A
tömb elemeiért (amik egyenkén JavaBean-ek) különböző modulok felelősek, és az
alapmodulnak nem kell tudnia a kiterjesztés plusz bean fragmentumairól. Csak
persze akkor meg az lesz a kérdés, hogy honnan tudjuk, hogy a lekérdezésnek az egyes oszlopaiból melyiket melyik JavaBean-be
dobjuk szét.

  
Nem tudom sikerült-e jól artikulálnom a problémát, de szerintem elég szerény
kívánalom. Talán tudja is valamelyik O/R mapping cucc, csak sokkal mélyebben
el kéne olvasni a doksikat.

