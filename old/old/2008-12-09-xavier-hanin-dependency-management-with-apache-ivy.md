---
layout: post
title: ! 'Xavier Hanin: Dependency management with Apache Ivy'
tags:
- Devoxx
status: publish
type: post
published: true
meta: {}
---
Az IvY egy függőség kezelő, amit ANT-ból vagy Java-ból lehet használni (és
parancssorból is, amint az előadásból kiderült). Személyes véleményem szerint
sokkal jobban ki van találva mint a Maven függőség kezelője, viszont ez
**csak** függőség kezelő, a Maven meg egy teljes build környzet. (Azon kívül
úgy tudom a Mavenben is éppen írják újra ezt a részt).

  
Az előadás pont a flexibilitást emelte ki, gyakorlatilag bármit ki lehet
cserélni rajta. A konfliktus kezelést, a fájl formátumot (olvas pom-ot, és
saját xml-t, de bárki írhat magának), saját atrbútumokat lehet használni,
triggerek vannak, stb.

  
Az álmom igazából az, hogy a a Maven-ben is hasonlóan ki lehessen cserélni
majd valamikor mindent, pl. éppen a függőség kezelőt: ha valami mást írok a
leíróban, akkor azzal mondhassam meg, hogy most egy másik artifact-ot töltsön
le (kvázi egy függőség kezelő plugint), és majd az kezeli a függőséget.

  
A demó az Eclipse pluginre épített, ami egyrészt nagyon jól nézett ki,
másrészt rögtön felveti az eszköz támogatottság kérdését (nyilván én nem
Eclipse-t használok, és nincs hozzá jó NetBeans plugin ezért sír a szám :-) ).
Az Eclipse plugin amúgy elég meggyőző, pl. ANT nélkül is hajlandó IvY-t
használni (bár én őrizkednék a nem IDE-független projektektől).

  
ps: Jövő héten jön ki a 2.0-final

