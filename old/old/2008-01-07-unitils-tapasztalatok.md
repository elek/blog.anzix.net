---
layout: post
title: Unitils tapasztalatok
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2008/01/unitils-tapasztalatok.html
---
Régóta nem írtam már ide, pedig jócskán felgyűltek a témák. Az egyik ilyen az
[Unitils](http://unitils.org/summary.html) bevezetése az egyik projektünkbe.
Az Unitilsnek Kocka
[egyik](http://iwillworkforfood.blogspot.com/2007/12/javapolis-2007.html)
blogbejegyzése nyomán kezdem utána nézni.

  
Az Unitils a Junit3,Junit4 és a TestNG keretrendszerek mindegyikével
házasítható, ezeknek a teszt környezeteknek funkcióihoz adnak hozzá a
moduljai. A Unitils moduláris felépítésű, mi három modulját használjuk:

  
database

A database modul egy adott környvtárban található sql szkripteket sasolja. Ha
valami is vátozik, akkor az adatbázis teljes sémáját bedarálja, és újra
futtatja a szkripteket. Nagyon praktikus olyankor, amikor a sémát SVN-be
tároljuk, de többen is szerkesztgetjük.

  
dbunit

Ez igazából a dbunit-ra egy wrapper modul. a @DataSet és @ExpectedDataSet
annotációkkal jelölhetjük meg a teszteinket, és ezekkel adhatnk meg egyszerű
XML-eket, amikben a teszthez szükséges adatbázis tartalom van. Pl.

  
ServiceOneTest.xml

<dataset>

<customer id="1" name="asd">

</dataset>

  
ServiceOneTest.testOne-result.xml

<dataset>

<customer id="1" name="changed">

</dataset>

  
Elég kényelmes dolog, de van egy fontos tulajdonsága. Az előző modul a séma
létrehozása után alapból az összes constraint-et disabled-re állítja. Ez
egyfelől kényelmes, mert az XML-ekben tényleg csak azt az adatot kell
beleírni, amit tesztelünk (esetünkben a customer name tulajdonságát), és pl. a
company mezőt nem, mégha elvileg foreign key lenne is rá. Persze ez azt is
jelenti, hogy a constraint-eket ilyenkor nem teszteljük.

(Megadhatjuk azonban azt is, hogy a constraintek maradjanak).

  
ejb3

Ez a harmadik modul amit használunk, saját fejlesztés (nagyon egyszerű új
modulokkal kiegészíteni a Unitils-t). Ha talál egy @EJB annotacíót a unit
tesztünkbe, akkor oda injektálja az EJB-t, és az EJB-be is ellenőrzi az
annotációkat és oda is injektál mindent (pl. EntityManager). Nagyon kényelmes,
mert gyakorlatilag az egész EJB oldalt standalone unit tesztekkel tudjuk
tesztelni. Ha igény van rá, talán majd publikáljuk is.

  
Ezenkívül van még Spring, Hibernate és EasyMock-ot támogató modulja is, azokat
mi nem használtuk. Viszont standalone alkalmazáshoz is viszonylag kis
fájdalommal hozzá lehetett gyógyítani (egy migráló szkript használja a Unitils
database modulját arra, hogy ő is mindig az aktuális adatbázis sémán
dolgozzon). A forrása is szép, mindenütt interface-k vannak, sok helyen lehet
változtatni az implementációt.

  
Nyilván ezzel is előfordulnak szívások, de összességében csak ajánlani tudom.
Használata Junit 4.4-től csak annyi, hogy a tesztet meg kell annotálni egy
@RunWith(UnitilsJUnit4TestClassRunner.class) annotációval.

