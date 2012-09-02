---
layout: post
title: Subversion web client
tags:
- subversion
- sventon
- webclient
status: publish
type: post
published: true
meta:
  _edit_last: '2'
---
Nem kardinális, de jó lenne egy webes subversion kliens. A <a href="http://anzix.net/hudson">hudson</a>-os buildek is tudnának rá hivatkozni, meg néha egyszerűbb egy webes kliensen megnézni a fájlok régi állapotát.

Rövid keresgélés után két megoldás kínálkozott, a Polarion <a href="http://www.polarion.org/index.php?page=overview&amp;project=svnwebclient">SVN web client</a>-je, és a <a href="http://www.sventon.org/">Sventon</a>.

A Polarion régi motoros a szakmában egy rakat Subversion-os projektjük van. Az ő browserük sokkal szebb, (bár konfigurálni macerásabb: a web.xml-ben kell a paramétereket állítgatni). CDDL licensz alatt a forrása is letölthető, de első blikkre nem találtam meg a hibakövető rendszerüket, és hogy hogyan küldhetek be patcheket. Továbbá nagy hiányossága, hogy nem sikerült bekonfigurálni teljesen annonymous kliensnek. (Jellenző, hogy a saját forráskódját is csak úgy lehet böngészni, ha guest/guest-tel belépünk).

A Sventon designilag sokkal csúnyább, de funkcionalitásban kb. ugyanazt tudja. Tud teljesen csak olvasható, de jelszót nem igénylő módban futni, és a projekt oldala is sokkal jobban mutatja a nyílt fejlesztés jeleit. (Egyénként BSD licenszű). Konfigurálni első futtatáskor webes felületről lehet.

Egyelőre tehát a Sventon lesz a befutó, mégha csúnyább is (esetleg kéne hozzá csinálni majd egy szebb sminket).
