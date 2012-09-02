---
layout: post
title: JSF sources
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2007/04/jsf-sources.html
---
Nem ecsetelem, hogy hogy jutottam ide, de jelenleg épp az egyik ablakban az
Apache MyFaces forráskódja a másikban a JSF 1.2 Sun-os Reference
Implementation forráskódja van. És ezeket böngészem csak úgy saját
gyönyörűségre. Tanulságos. Lenyűgöző.

  
Ugyanarra a speckóra két elég eltérő implementáció, úgy hogy a specifikált
részben a Java osztályok felépítése tök ugyanolyan, mégis teljesen különböző
filozófiák, a működés meg persze ugyanaz (elvileg)

  
Megannyi sajátos megoldás. Például, hogy TLD fájlban definiálhatunk Listener-t
is nem csak tag-eket. (MyFaces hibakezelése szerint lehet web container, ami
nem tud róla) Vagy hogy a RI a WEB-INF/... os kérésekre nem forbiddent (403)
hanem 404-et ad vissza. (A MyFaces kommentben csodálkozik, de követnie kell a
RI-t, az a referencia). Vagy hogy a RI-ben ilyen frappáns metódus nevek is
előfordulnak: verifyFactoriesAndInitDefaultRenderKit. 38 karakter ha jól
számolom. Maga a gyönyörűség.

  
Szóval igen szórakoztató olvasmány, és talán a JSF megértéséhez is közelebb
kerülök vele.

  
Olvassatok forráskódokat ti is, a legjobb olvasmány.

