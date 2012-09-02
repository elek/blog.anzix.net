---
layout: post
title: ! 'Dan Allen: Seam in Action'
tags:
- Devoxx
- seam
status: publish
type: post
published: true
meta: {}
---
Az előadó a Seam in Action könyv szerzője, az előadásban is a könyv
szerkezetét követi. Az előadás eleján általános dolgokat tudtunk meg a Seam-
ről: a leginkább szimpatikus mondás az volt, hogy ez egy framwork a glue
értelemben, sok mindent össze tud kötni. Használhatsz vele JPA-t, de
Hibernate-et is, EJB3-at de EJB nélkül is. Hogy ezt elérje mindenhová saját
annotaációkat kell ékelni.

  
Aztán jött némi demó a seam-gen segítségével: egy egy script, amit ANT-os
projektet csinál, JBoss-t használ, de nagyon ezt ajánlotta ismerkedésre,
prototípusra. Később bármi más projektet is össze lehet rakni.

  
Aztán elkezdtünk turkálni a részletes funkciókban: sokszor elhangzott, hogy ez
vagy az a JSF-ből nagyon hiányzik, de a Seam-mel már megy. Volt sok példa
dependency injection-ra. És viszonylag sokáig szó volt a scope-okról (Seam-ben
van a request és a session scope között egy conversation scope, ami a webflow
nevű megoldásokra hajaz.) és a conversation-ok működéséről.

  
Én a magam részéről több kódot vagy demót láttam volna és kicsit mélyebben
(egy három órás előadáson van rá idő), meg több példát arra a glue-ra. Pl.
hogy hogyan működik JCR-rel és Wickettel? A pageflow egy érdekes kérdéskör, de
annyira nem érzem kardinálisnak, hogy ez alapján válasszak webes
keretrendszert. Jobban érdekel, hogy hol vannak a határai, és mit lehet benne
megcsinálni, és mi az amit már nem.

  
Kicsit az az érzésem ezekkel az University előadásokkal, hogy az előadók nem
nagyon tudják, hogy mit kezdjenek az idővel, és egy szokásos előadást
csinálnak, csak három óra hosszan, ami azért nehezen működik. Jó ellen példa
lehetett a tegnapi Test Driven Development előadás (nem azon voltam bent, csak
olvastam utólag). Az előadáson állítólag egy feladatot kompletten
leprogramoztak a szinpadon egy show keretében, ahol a közönség közül jöttek az
előadő mellé párprogramozni emberek.

