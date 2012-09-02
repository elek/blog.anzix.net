---
layout: post
title: ! 'Doug Tidwell: Java + XSLT 2.0'
tags:
- Devoxx
- jaxp
- saxon
- xalan
- xml
- xslt
status: publish
type: post
published: true
meta: {}
---
Előre kell bocsátanom, hogy hard XSLT ellenes vagyok. Az XSLT-ről az a
véleményem, hogy - sarkosan fogalmazva - butaság megpróbálni egy programozási
nyelvet XML-ben implementálni. Na jó, egyszerűbb feladatokat meg lehet vele
könnyen csinálni, de egyszerűbb feladatokat bármiben meg lehet csinálni :).

A többi előadás azonban semmitmondóbbnak tűnt, hát beültem.

  
Java toolok: **Xalan**: XSLT 1.0, XPath 1.0; **Saxon** XSLT 2.0 XPAth 1.0
XQuery 1.0, viszont a Saxon-SA a schema-aware változat már kereskedelmi
(Saxon-B ingyenes, de ez nincs benne). Ezeket láttuk működni, meg JAXR-t,
Apache FOP-ot, XSLTC (XSLT kód fordítása java kóddá).

  
Ami új volt, hogy az XSLT kiterjeszthető:

  * Extension elements: olyan elemekkel, amiket XML utasításnak értelmez (pedig alapból nem azok)
  * Extension functions: funkciókkal, amik az alap XSLT-ben nincsenek benne, de mi használni akarjuk. pl. xalan-java:com.packageClass paraméter  

Xalan támogatja a Bean Srcipting Frameworkot is (BSF), amivel az extension
function-t más nyelvbe is meg lehet írni (pl. JavaScript, Jytthon, JRuby).

  
Vannak még XSLT 2.0-ban custom collation-ok, amikkel String összehasonlítások
definiálhatók, és ezáltal saját rendezéseket lehet pl. kitalálni.

  
Sok eget verő dolog nem hangzott el, de ez az előadó is olyan volt, akinek
egyrészt nagyon okosan összerakott fóliái voltak, másrészt a maga az előadó is
olyan volt, aki a maga sajátos stílusában végig fent tudta tartani az
érdeklődést. Konkrétan úgy tudott beszélni, hogy már-már meggyzőzött, hogy az
SVG nem csak egy okos dolog, hanem a világ egyik legkellemesebb dolga. és ezt
bármilyen XML/XSLT barát technológiáról. Az egyetlen, ami hiányzott, hogy
általában a demónak csak a bemenetét és a kimenetét láttuk, és az XSLT-t pont
nem.

