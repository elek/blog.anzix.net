---
layout: post
title: Verzió kontroll
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2007/09/verzi-kontroll.html
---
Erik Burke [írt](http://stuffthathappens.com/blog/2007/09/28/4-signs-you-are-
fighting-your-version-control-tool/) néhány dolgot, arról, amikor használunk
ugyan verzió kontroll rendszert, de valami azért mégse 100-as vele. A gyanús
jelek szerinte:

  
1. Ha a helyett, hogy törölnénk a kódból inkább kommentezünk, hátha még
kelleni fog a jövőben. Hülyeség: a verzió kezelő pont arra való, hogy megnézd
az előző verziót. _(Nálunk ez rendesen be van tartatva, code reviewn nem megy
át, ha kikommentezett sorok vannak.)_

  
2. Hetente egy nagy kommit, sok kis helyett. _(Nálunk sajnos a rendszer miatt
ez van. A clearquest-re ráépített rendszerben egy task = egy kommit, ami akár
40 órás task is lehet. Ha közben másnak is kénének újonnan létrejött fájlok,
akkor nincs más mint local copy.)_

  
3. Fizikai backup biztos ami biztos (ami ugye felesleges, mert a verzió kezelő
sokkal jobb backupot ad). _(Szerintem ez azért annyira nem probléma.
Legalábbis nálunk nem fordul elő.)_

  
4. History log: ahelyett, hogy a verziókezelőbe írnánk commitkor mi változott,
a fájlok elején txt-be írunk valami log félét. _(Abszolút igaza van, nálunk
pont ez van, és idegesít is.)_

  
Szóval nálunk a kincstári projektek 4/2 arány érnek el. Lenne még hová...

