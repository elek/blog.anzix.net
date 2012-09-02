---
layout: post
title: Testablility Explorer
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2008/05/testablility-explorer.html
  _edit_last: '2'
---
A [testability explorer](http://code.google.com/p/testability-explorer/) (nem
meglepő módon) egy kód tesztelhetőségét hivatott vizsgálni. Van egy publikus
demó [oldal](http://testabilityexplorer.org/ant/ant/1.7.0) is, ahol néhány OS
projekt tesztelhetőségét publikálják. (pl.
[itt](http://testabilityexplorer.org/ant/ant/1.7.0) az ANT 1.7-é).

Első látásra teljesen elvarászolt, de aztán kiderült, hogy igazából semmi új,
csak a _Cyclomatic Compexity_-t viszgálja, plusz az írható globális mezők
értékét (Counts the number of fields which are globally reachable by the class
under test and which are mutable.)

A [Cyclomatic Compexity](http://en.wikipedia.org/wiki/Cyclomatic_Compexity)
egy mérőszám, ami megmondja, hogy mennyi különböző lefutása lehet egy
metódusnak. Ha pl. van benne egy darab if, ami vagy igen vagy nem, az már két
lefutás. Minnél több lefutása lehetséges, annál nehezebb tesztelni. Nem nagy
truváj, a [PMD](http:/pmd.sourceforge.net) is mér ilyet. Most már inkább az
érdekel, hogy hogy méri mindezt az [ASM](http://asm.objectweb.org/)
segítségével. Ha lesz időm játszanom kell majd vele egy kicsit.

(Via: Az eszközre Alex Miller
[bejegyzésén](http://tech.puredanger.com/2008/05/07/javaone-eugene-kuleshov-
misko-hevery-on-practical-byte-code/) keresztül találtam rá amit [Eugene
Kuleshov](http://www.jroller.com/eu/) BOF sessionjéről írt. )

