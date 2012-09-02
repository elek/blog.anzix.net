---
layout: post
title: ! 'Phil Zoio: Impala - a dymanic module framework for java web development'
tags:
- Devoxx
- impala
- modularizáció
status: publish
type: post
published: true
meta: {}
---
Nem mondhatjuk, hogy üres a piac, ha egy új webframework fel akarja magára
hívni a figyelmet, akkor nagyon bele kell húznia.

  
Impala:

  * moduláris
  * a modulokat dinamikusan tölti be  

  * tud projektet generálni (ANT szkript)
  * depdendencyt kezel (egy ANT target letölti a fájlokat a maven repo-ból)
  * Spring alapú (más frameworkoket is támogat, pl. volt demó, hogy egy Wicket oldalt is berakott egy modulba)
  * Classpath varázslatokat csinál az OSGi-hez hasonlóan, de nem alapból OSGi modul formátumot használ (azzal indokolja, hogy így egyszerűbb. és hogy így nem kell OSGizálni a 3rd party librarykat). Viszont most már OSGi bundle-okat is be tud tölteni a barátság jegyében.  

Voltak benne ügyes ötletek, de azért nem úgy álltam fel, hogy végre láttam a
Megoldást.

