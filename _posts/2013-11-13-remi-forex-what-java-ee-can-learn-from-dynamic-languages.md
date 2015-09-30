---
layout: post
title: Remi Forex - What Java EE can learn from dynamic languages?
date: 2013-11-13 14:16
tags:
   - devoxx
   - invokedynamics 
   - javaee
type: dpc
---

Remi Forex ott folytatta körülbelül, ahol Brian Goetz abbahagyta, igaz sokkal kevésbé lehengerlő, inkább kicsit döcögősebb stílusban.

De hogyan tudna profitálni a Java EE az invokednyamics használatából? A példa egy hibernate és egy spring exception tree volt, amik tele voltak saját és dinamikusan generált proxykkal, ami a saját Java EE kódunk köré kerül. Ilyet mindenki látott már, nagyon sok framework dolgozik proxykkal.

Az előadás részletesen végigment azon, hogy hogyan működik egy nagyon egyszerű (Java EE) konténer, miért használnak végtelen sok proxy objektumot, és ebből mit tud a JVM kipotimalizálni.

Az invokdedynamics-okkal ezeket a végtelen proxy hívásokat el lehetne kerülni. És mivel az invokedynamics tudja cache-elni azt, hogy hogyan is kellene az adott helyen meghívni egy funkciót, ezért sokkal rövidebb és gyorsabb gépi kódot kaphatnánk. Ebben a felfogásban a Java EE nem is konténer a klasszikus értelemben, hanem egy compiler, mert ha ügyes invokedynamics hívások kerülnének a kódba, akkor nem lenne arra szükség, hogy egy konténer elemei ékelődjenek a saját kódunk metódhívásai közé (pl. egy nem lenne szükség proxyra két EJB hívás között). Hasonlóképpen dependency injection-höz vagy lombok szerű getter emulálásra is az invokednyamics lehetne a megoldás.

Maga az alapötlet nem volt rossz, de az előadás belefért volna egy rövidebb előadásba is. (Na jó, akkor lemaradtunk volna néhány szép assembly kódról).
