---
layout: post
title: ! 'Martin Marinschek: Servlet 3.0 & JSF 2.0'
tags:
- Devoxx
- jsf
- servlet
status: publish
type: post
published: true
meta:
  _edit_last: '2'
---
Nem az Early Draftról volt szó, hanem a hamarosan kijövő Public Draftról (sok minden változott). Néhány fontosabb dolog:

Modularizáció: web.xml helyett sok <em>web fragment</em> xml-t lehet írni, ezek összefésülődnek különböző szabályok szerint. Pl. egy library tartalmazhat egy ilyen fragmentet, amiben a saját filterét aktiválni tudja. Sajnos sorrendet jelenleg nem lehet mondani, ezért pl. egy autentikációs filtert, aminek mindig az elsőnek kéne lennie a filterek sorában, nem lehet mindig előre kényszeríteni, csak a web.xml szerkesztésével.

Annotációk: pl. @WebServlet, @ServletFilter, @InitParam, @WebServletContextListener az XML konfigurációk alternatívájaként.

API-ból is hozzá lehet ezekhez férni, pl. lesz addServlet(), addFilter(), addUrlFilterMapping, stb.

Aszinkron kérések támogatása: ezt elég sokáig taglalta, valami olyasmi, hogy egy request kiszolgálást abba lehet hagyni hosszabb időre, és más requestekből megmondani, hogy a nyitott kapcsolaton mit küldjünk le a kliensnek. A dallamát igen, az ízét még nem érzem a dolognak. Cometelni kicsit egyszerűbb lesz majd.

Az is elhangzott, hogy a Public Draftba nem, de a végleges változatba valószínű valamilyen file upload támogatás.

Aztán rákanyarodtunk a JSF 3.0 előnyeinek taglalására, és jó university előadáshoz méltóan mélyen belement az újdonságokba (pl. Facelets support, AJAX support, exception kezelés). Arra nézve nem lette m okosabb, hogy ha a cluster supportról nem gondolkozunk, akkor a JSF vs. Wicket vitában mi szól az előbbi mellett (igen, én hajlok az utóbbira).

Ja és 3x3 Buzzword Bingó is volt 2 kg belga csokiért.

(Az igazsághoz az is hozzátartozik, hogy a délutáni University előadások 3 órásak egy rövid szünettel, és a szünet alatt átpártoltam a Flex FX (<a href="http://graphics-geek.blogspot.com/">Cheet Haase</a>) pót előadásra. Itt főleg arról folyt a szó, hogy milyen könnyen össze lehet rakni milyen csoda felületeket. Szóval lehet, hogy a JSF előadás végén még meggyőztek volna.)
