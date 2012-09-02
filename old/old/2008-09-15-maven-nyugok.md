---
layout: post
title: Maven nyűgök
tags:
- build
- maven
status: publish
type: post
published: true
meta:
  _edit_last: '2'
---
Lassan kikerülhetetlenül beszivárog az életembe a Maven minden előnyével és hátrányával együtt.

Az egyik legkényelmetlenebb dolog a használata közben, hogy ha egy projekt több modulból is áll, és az almodulok függenek egymástól, akkor a függőségeket nem fordítja újra a Maven egy adott almodul fordításakor.

A NetBeans pl. az ANT alapú projekteknél ezt csinálja: ha van egy közös lib projektem, amit a war és az ejb modul is használ, akkor a war fordításakor megnézi, hogy a lib-be változott-e valami, és ha igen automatikusan újra fordítja.

A Maven ilyet nem csinál (vagy nem tudom, hogy hogy lehet ezt elérni). Próbáltam rákeresni, de csak azt a választ találtam, hogy ilyet filozófiailag ne akarjak. A modulok önállóak, és ha változtatok valamit az egyikben, azt külön teszteljem, majd terjesszem az új változatot a repositoryn keresztül. Ezt a választ egy ideig el is fogadtam, csak a kolegáim kérdőjelezték meg, hogy talán egy csupa DTO-t tartalmazó projektet nem nagyon kell tesztelni, és az igazán le fordulhatna automatikusan, ha csak egy új gettert raktam bele.

(Ja, és még azt is ki kell derítenem, hogy hogyan lehet elérni, hogy hogy a package phase-ben ne hívódjon meg a jar:jar. Az ellenkezőjére már sok példát láttam, az executions jól megoldja, de az nem világos, hogy hogyen lehet törölni executionst. Lehet, hogy nem úszom meg, hogy a maven forráskódját is meg ne ismerjem?)
