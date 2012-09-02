---
layout: post
title: Dependency management és Apache (pletykák)
tags:
- apache
- build
- Devoxx
- ivy
- maven
status: publish
type: post
published: true
meta: {}
---
Na, akkor még egy kis pletyka. Miután az előző bejegyzést elküldtem, még
beszélgettünk kicsit. Egyrészt valaki megkérdezte, hogy a Maven miért nem
használja dependency managerként az IvY-t. Azt mondta Xavier, hogy volt róla
szó, és beszélgettek róla a Mavenesekkel, és mindketten rendkívül nyitottak,
csak még nem lett belőle semmi. Állítólag a Mavenbe nagyon bele van drótozva a
függőség kezelés mindenhová, de vannak rá törekvések, hogy ez refaktorálva
legyen, vagy esetleg cserélhető függőség kezelő legyen.

  
Beszéltünk még az EasyAnt-ról, ami az ő proof-of-concept projektje volt: ez
egy ANT alapú de a Maven koncepcióit elsajátító rendszer volt. Én azt hittem,
hogy elsikkadt az egész, de kiderült, hogy ugyan neki nincs rá ideje, de mások
fejlesztgetik tovább ([easyant.org](http://easyant.org/trac)), csak sajnos
most csak egy patch-elt ANT-tal tud együttműködni. Elvileg a patchek átmennek
majd az ANT forrásba, és az ANT következő release-vel lehet majd könnyen
használni.

  
Valamint tt van még a [Gradle](http://www.gradle.org/) (tegnap volt előadás,
de nem azon voltam), ami egy Groovy alapú build rendszer, amit szintén IvY-t
használ. Persze annak az IDE támogatása valószínű még rosszabb, ezért is
izgalmas projekt az EasyAnt, mert ANT-ot viszont mindenki támogat, és ha ANTba
okosan beépül, akkor már szinte mindenhol ott van.

