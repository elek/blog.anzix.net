---
layout: post
title: NetBeans profiler
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2007/05/netbeans-profiler.html
---
Azt még nem is írtam, hogy múltkor kb. egy napot ellötyögtem vele. Egy ANT
alapú (freeform) külső tomcet-et használó NetBeans projecthez kellett belőnöm.
Mielőtt neki kezdtem valaki fenyegetett is, hogy ő már próbálta és szétfagyott
az egész.

  
Ehhez képest egész kellemesen csalódtam. Nagyon hamar működött, és tényleg
kezelte az ANT alapú projektemet is.

  
Kissebb problémák voltak:

  * Az IDE-ből indítva a tomcat-et profile módban úgy tűnt, mintha nem kapná meg a környezeti változók értékeit (ami pl. orakli eléréshez kell). Szerencsére volt lehetőség manual attach-ot is játszani, és azzal végül ment, csak command lineból kellett indítgatni az IDE-t.
  * 1.4-est nem szereti nagyon (igaza van, én se szeretem), módosított JVM kell hozzá. Ez letölthet NB plugin formájában, csak a dependency rosszul van a pluginben definiálva, és ezért a legújabb profilerrel nem megy (persze nem volt túl nagy feladat a jarban megtalálni a descriptor-t és átírni a dependecyt, és utána már megy is.).
  
  
Ezt leszámítva tényleg szép színes szagos, és egész jól használható volt.
Rögtön találtam is néhány furcsa dolgot (reflection api szokásos lassúsága) a
projektben, ami miatt már megérte.

