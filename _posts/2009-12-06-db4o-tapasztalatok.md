---
layout: post
title: Db4o tapasztalatok
tags:
- db4o
status: publish
type: post
published: true
meta:
  _edit_last: '2'
---
Aktuálisan kedvenc állatorvosi lovam, egy wicket + guice + warp-persistes alkalmazás. Illetve a technológiák gyakran változnak benne, például alig egy órája dobtam ki az utolsó JPA függőséget is belőle, és teljesen átáltam db4o-ra. (A JasperReport helyét is könnyen átveheti a BIRT, illetve a Salve is sorban áll tesztelésre)

Az első tapasztalatok:

 * Nem árt tudni, hogy GPL, tehát az über titkos üzleti alkalmazásban nem használhatom.
 * Érezhetően gyors. Mondjuk iszonyú kis adatbázisom van, gondolom jól betölti az egészet a memóriába.
 * Az API-ja csábítóan egyszerű. Queryket írni annonymous-inner-class-okkal igazi fényűzés.
 * Cascade-ra ugyanúgy gondolni kell. Objektum lekérésnél alapból 5 mélységű a rekurzió, de update/store-nál default nincs rekurzió. Eltartott egy ideig míg rájöttem, miért nem megy rendesen. A rekurzió szintje állítható teljes adatbázis, entitás és mező szinten is. Csak kérni kell.
 * A séma változásra ez is érzékeny (különösen, ha az <a href="http://developer.db4o.com/Resources/view.aspx/Reference/Implementation_Strategies/Refactoring_and_Schema_Evolution/Refactoring_Class_Hierarchy">objektum hierarhia</a> változik)
 *A managed-detached objektumokra ugyanúgy figyelni kell. Amíg nem sikerült összeraknom számos esetben elszabadultak az objektumok, és megsokszorozódtak. (Csak egy oc.store() metódus van, és ha detached-et akarok updatelni, akkor lelkiismeret furdalás nélkül létrehoz új objektumot.)
 *Alapból tud olyat, hogy minden objektumnak van ID-ja (van UUID-ja is, de az nem kellett). Ebben az a furcsa, hogy az ID egy belső dolog, és nem az entitásban van tárolva, hanem API-ból lekérdezhető: kedves konténer, ennek a managed objektumnak mennyi az ID-ja? Az viszont nem meglepő, hogy egy detached objektumnak már nem lehet elkérni. Talán van valami merge itt is, de még nem találtam meg. Igaz nem is nagyon kellett, mert a Wicket detachable modeljei pont tudják azt, hogy az ID-t eltárolják, amíg még managed az entitás, és az alapján visszatöltik, amikor kell.
 * Nagyon barátságosan tesztelhető, mert egy statikus függvény meghívásával át lehet az egészet in-memory db-re állítani. Onnantól kezdve csak iniciaálizálni kell benle pár adatot, és mehetnek az integráiós(abb) tesztek.
 * Constraintek Java API-ból adhatóak meg. A Bean Validation Frameworkot valószínű 5 sorból be fogom tudni kötni.
 * Nincs jó felület, ahol meg tudom nézni a tartalmát, és alap szerkesztéseket tudok végrehajtani. Egy BeanShell-t próbáltam már rá állítani, de még nem sikerült összelőni.
 * Elég jó doksija van, pedig még csak főleg a tutorialt olvastam, a reference manualnak csak a részeit.
 * Érdekes következménye van annak, hogy minden objektumot el tud menteni. Pl. a JPA-ból kiszelektált csoda objektumokat nem érdemes rögtön elmenteni, mert előhúzás után a lazy mezők rosszul fogják érezni magukat. Ugyanígy a BigDecimal serializálása alapból nem triviális, ennek a kezelésére külön kiterjesztést kell bekapcsolni (bekapcsolt kiterjesztéssel szerkesztett db fájlt olvasni legközelebb szintén csak bekapcsolt kiterjesztéssel rendelkező konténerrel lehet).


Szóval egyelőre barátok maradunk és bent marad. Még meg kell nézni a tranzakciókat, a Bean Validation Frameworkot bele reszelni, és majd byte\[\]-el kell még tesztelni.

