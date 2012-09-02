---
layout: post
title: Checkstyle plugin
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2007/03/checkstyle-plugin.html
---
Bár a kódjaim most már kibírják a gyár
[checkstyle](http://checkstyle.sourceforge.net/) próbáját, néhány kimondatlan
szabályoknak nem feleltek meg, és sajnos a checkstyleban nem is voltak hozzá
rule-ok. (pl. a javadoc csillagainak a kívánt fajta behúzásának elenőrzése).

  
Úgy hogy múltkoriban összedobtam néhány Checkstyle extensiont saját
használatra. Nem volt nagy flikk-flakk, mindenkinek csak ajánlani tudom, friss
és használható doksi volt a honlapon, meg persze néhány példa is.

  
Antlr fát kapunk vissza, és egy mellékelt alkalmazással meg is lehet nézni a
fát.

Ami viszont új volt, hogy se a javadoc-ot se a whitespace-eket nem parseolja.
Az utóbbit úgy lehet kitalálni, hogy két token pozicióját megadja, és
megnézzük, hogy köztük mi van a fájlban. Az előbbi is hasonló, de szerencsére
erre már a Checkstyle is ad apit.

  
Ezeket kéne kipróbálni a [Jackpotban](http://jackpot.netbeans.org/) is, és
akkor tényleg nem lehetne már fogást találni rajtam.

