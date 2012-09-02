---
layout: post
title: Munkák és napok
tags:
- glassfish
- hétköznap
- oracle
status: publish
type: post
published: true
meta:
  _edit_last: '2'
---
Az úgy van, hogy én igyekszem mindig pozitívan hozzáálni a világhoz, csak sajnos mikor konkrétan használni akarom a dolgokat valahogy mindig kiderül, hogy nem úgy hajlik, ahogy én szeretném. Ma bent ismét előjött, hogy egy kritikai attitűdű Java-s blogot kéne írni, ami nem kertel, hanem kitér a termékek és szoftverek minden problémájára: valós képet fest a világról. Kedves blog lenne, olyan igazán megkeseredett hangvételle, és kerülné még a látszatát is, hogy valamit pozitívan méltasson.

Csak hogy kicst érzékeltessem a dolgot szeretnék két momentumot leírni a napomból:

Délelőtt felmerült egy kérdés a Glassfish loadbalancing tulajdonságát illetően, aminek jó lett volna utána nézni. Egyikünk a <a href="http://wiki.glassfish.java.net/Wiki.jsp?page=BuildInformation">nyílt forrást,</a> a másikunk a <a href="http://java.decompiler.free.fr/">decompileolt</a> változatot nézte, kinek mi akad hamarabb a kezeügyébe, míg meglett a válasz. De ezen folyamat alatt kiderült, hogy <em>Build instructions</em> tényleg nem viccel, a Glassfish 2 tényleg csak Maven 1.0.2-vel forgatható. Nem elég hogy Maven 1, de abból is az a változat, amit már le se lehet tölteni az Maven oldalról (az <em>aktuális</em> az 1.1-es), hanem az archive.apache.org-kell kibányászni, hogy menjen.

A délután nevezetes eseménye meg az volt, hogy Oracle SOA Suite-et telepítettem (próbáltam), hogy kicsit kipróbáljam, és rajta keresztül még inkább átérezzem az élet nagyszerűségét. Le is töltöttem a röpke 700 megás telepítőt (az Oracle telepítők mindig 700 megásak, bármit is akarsz letölteni, ha nincs akkora a szoftver, akkor melléraknak nullákat meg egyeket, hogy kijöjjön a CD). A telpítőt a nagyszerű cpio-val csomagolták be, hogy még azt is meg kelljen keresni, hogy milyen kapcsoló kell ahoz, hogy rendesen kicsomagolódjon, mert a cpio alapból könyvtárakat nem tömörít ki, csak fájlokat, de azt meg csak akkor, ha megvan a könyvtár, amibe a fájlnak kerülnie kell. Szóval elindítom a telepítőt, ami némi kattogás után közli, hogy ez a linux (Ubuntu) nem a Linux, mert ő csak Red Hat Enterprise izén hajlandó futni és esetleg Susén, de abból 9esen (a világ OpenSUSE 11.1-nél tart.)  és különben meg szevasz.

Mit mondhatnék, <a href="http://napirajz.hu/archives/2005/08/20/aljaegyvilagban/">alja egy világban élünk</a>. Tényleg kéne az a blog.

(Ha lesz időm holnap már tényleg leírom a Gradle-s tapasztalataimat a múlt hétről, és lesz benne (valamennyi) pozitív (is). Köszönöm, hogy meghallgattak.)
