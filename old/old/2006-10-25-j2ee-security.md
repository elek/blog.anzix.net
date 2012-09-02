---
layout: post
title: J2EE security
tags: []
status: publish
type: post
published: true
---
Bármennyire is csodálná valaki a j2ee építmény, azt mindenkinek be kell
látnia, hogy a security rész elég halványra sikeredett.

Azt, hogy mit tud, és mit nem, elég jól összefoglalja
[ez](http://www.javaworld.com/javaworld/jw-07-2004/jw-0726-security.html) a
cikk, szépen körbejárja az 1.4-ben lévő dolgokat (a részletességre jellemző,
hogy olyan fejezetek is vannak benne, hogy What is a container? De ennek
ellenére tényleg korrket.)

  
A cikk a container security megoldásira ezeket az előnyökket mondja:

  
* beépített, tehát nem kell nekünk szarozni a session-ba rakosgatásával a User objektumoknak
* kőbe van vésve az apija (csinálhatunk pl. taglibrary-t a használatához, ami mindenhol menni fog)
* a több webapp között (egy szerveren) hordozni lehet a a belépési információt
* Átmegy a webtier és a business tier között
  
Nekem ebből az utolsó a legmeghatározóbb. Az azért tényleg kényelmes, hogy
weben authentikálok, és EJB-k között is meg lesz a user info. Viszont cserébe
a container semmit sem ad. Nem lehet jól bővíteni, az apija minimális,
auditálás 0, stb.

  
Van ugyan a [JAAS](http://java.sun.com/products/jaas/), de ahogy a cikk is
írja:

JAAS is included as a required authentication method that containers must
support. But the specification is not strict about how the container should
provide this functionality; therefore, each container provides different
support for JAAS.

Pl. a Sun Java Application Server-ben egy com.sun-os osztályt kell
leszármaztatni saját realm írásakor, ami ugyan leszármazottja a JAAS
osztályoknak, de egy másik appserveren hajunkra kenhetjük az egészet.

  
Az meg már csak hab a tortán, hogy a JAVAEE 5 speckóban ilyen kedves
bekezdések vannak:
  

> Web-based internet applications often need to manage a set of customers dynamically, allowing users to register themselves as new customers. This
> scenario was widely discussed in the servlet expert group (JSR-53) but we were unable to achieve consensus on the appropriate solution. We had to abandon this work for
> J2EE 1.3, and were not able to address it for J2EE 1.4, but hope to pursue it further in a future release.

  
(kiemelés tőlem)

  
Nem marad más hátra, mint mindenféle külső szoftvert használni. Ezek közül is 2 megoldást találtam:

* Gyártófüggetlent, ami csak a servlet apira épül, jól hordozható, és általában elég pehelysúllyú.
* Robosztus megoldásokat, amiktől gyártófüggő lesz a kódunk, viszont SAML-tól kezdve mindent tud.
  
Azt utóbbira (amennyire látom) példa a Sun (Java System) Access Manager termék, ezt még nem sikerült mozgás közben látni, az előbbire viszont egy elég jó (bár nem túl friss lista) olvasható
[itt](http://www.manageability.org/blog/stuff/single-sign-on-in-java/view).

Amiket ebből megnéztem

[jGuard](http://www.jguard.net/): Ez nézett ki a legjobban, valamennyi doksija
is úgy tűnt, hogy van, van nem túl régi release, és a tervezése is
elfogadhatónak tűnt távolról nézve. Gyakorlatban viszont se Tomcat-tel se
Glassfish-sel nem sikerült működésre bírni a doksija alapján. 3-4 óra szívás
után frissen telepített Tomcat-tel (NetBeans embedded-del nem) a példa
alkalmazást sikerült feléleszteni.

Amúgy Pure JAAS modulokat eszik, valószínű, ha egy kicsit szájbarágósabb,
precízebb leírása lenne, még tetszene is.

  
[Kasai](http://www.manentiasoftware.com/kasai/goToHome.action): Ezt még több
helyen linkelték: 2005-ös release. Azt mondja, hogy az ő saját API-ja sokkal
jobb mint a JAAS. Hát lehet.
  
[Seraph](http://opensource.atlassian.com/seraph/): Atlassian, tehát már ajánló
levél, plusz tisztességesen legenerált lap/doksi (maven). A SSO menüpont alatt
viszont azt [ajánlják](http://opensource.atlassian.com/seraph/sso.html) , hogy
úgy használjuk SSO-nak, hogy egy szerveren autentikálunk, ott egy cookie-t
ragasztunk a kliensre a user névvel. És ha a domain alatt egy másik
alkalmazáshoz téved a felhasználó, automatikusan beléptetjük a cookie-ben
tárolt felhasználó nevére. Ezt vagy nagyon nem értem, vagy nagyon gyanús. A
cookie-k mintha kliens oldalon lennének, és azt a user nevet írom bele,
amelyiket akarom.

[Gabriel](http://gabriel.codehaus.org/): Azt mondja azt adja mint az EJB (ami
nem túl sok) csak EJB nélkül. Mellesleg
[halott](http://cvs.gabriel.codehaus.org/)

Mindig óvva intenek, hogy feltaláljam azt, ami már úgyis meg van, de egyelőre
úgy tűnik, hogy ha normális security szolgáltatásra lesz szükségem nekem kell
majd implementálni.

