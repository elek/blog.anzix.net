---
layout: post
title: "Mike West: Browser-side security"
date: 2013-11-14 16:34
tags: 
   - devoxx
   - xss
   - https
   - security
type: dpc
---

Délelőtt már bele néztünk egy fél security előadásba, ott PMD és Findbugs eszközök demózása volt (a látott részben). Ezzel szemben ez megint egy nagyon jó, informatív, sodró lendületű előadás volt.

Az az alapvetés, hogy előbb utóbb mindannyian elkövetünk hibákat, és előfordul, hogy Cross Site Scripting-et (XSS) megengedő hibát kódolunk az alkalmazásunkba. 

> We are all idiots with deadlines

Hogy mégis csökkentsük a bajt és védjük magunkat, okos HTTP Headereket használhatunk. Ilyesmikről volt szó:

* Set-Cookie: ...; *security*; httpOnly
* Strict-Transport-Seucrity
* Publick-Key-Pins
* X-Frame-Options
* X-Content-Type-Options
* X-XSS-Protection
* Content-Seucity-Policy

Ezek használatához persze HTTPS kell, mert ha bárki módosíthatja a kérés/válasz folyamot, akkor nem megyünk sokra a Headerjeinkkel. Tehát a hangsúlyos üzenet valahogy így hangzott:

1. Használjunk mindenhol HTTPS-t.
2. Olvassuk el [ezt](http://mkw.st/r/csp) a cikket a Cross Security Policy-ról. 

Az előadó azt mondta, hogy ha ez utóbbi megmarad a hallgatóságban, akkor már boldog, mert szerinte ez a legfontosabb. Mi se ajánlhatunk mást...
