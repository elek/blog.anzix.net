---
layout: post
title: NoSQL helyzetjelentés
tags:
- mongodb
- nosql
status: publish
type: post
published: true
meta:
  _edit_last: '2'
---
Az <a href="http://jtechnics.anzix.net/2010/06/29/summer-of-nosql-nagyhazi/">előző posztban</a> vázoltam egy feladatot, amiben NoSQL adatbázisokba dolgozom fel az <a href="wiki.openstreetmap.org">OSM</a> térképadatait. Az aktuális kód <a href="http://bitbucket.org/elek/nosqlproto/overview">elérhető</a> a bitbucketről, az alábbiakban néhány megjegyzés hozzá, minden rendszer nélkül:

1. Az OSM adatszerkezete egyszerű, három típus van: node (egyetlen pont a térben), way (nodeok halmaza, lehet nyílt és zárt is), relation (nodeok és way-ek halmaza). Persze mindegyikbek van földrajzi koordinátája és kulcs érték pár típusú attribútum halmaza.

2. Jelenleg Magyarország hozzáférhető térképadataival dolgozom. Ebben nagyságrendileg 900 ezer node és 80 ezer way van.

3. Backendnek első körben a MongoDB-t kezdtem el használni. (Ákosnál épp olvasható róla egy <a href="http://cesjava.freeblog.hu/archives/2010/07/09/mongodb_a_dokumentum-orientalt/">rövid bevezető</a>)

4. Betöltéshez az Osmosis programot használom. Ez tud az OSM export XML-ekkel dolgozni, illetve ezeket  transformálni is tudja. Elég ügyesen meg van írva: pipe-ok vannak benne, és ezeket lehet egymás mögé tenni. Én egy egyszerű pipe-ot <a href="http://bitbucket.org/elek/nosqlproto/src/tip/mongodb-plugin/">írtam</a>, ami tetszőleges helyről származó OSM adatokat (nálam egy xml reader pipeból származókat) tölt fel mongodb-be.

5. A forrás XML 100 Mb. A betöltendő adatok nagyságrendjét már írtam. A betöltés néhány másodperet vesz igénybe.

6. A MongoDB szinte az egyetlen olyan NoSQL DB, ahol van geospatial index is. Ez egyszerű feladatokhoz elég jó, de komplexebb lekérdezésekhez már nem elegendő. Mivel más NoSQL adatbázisokat is akarok használni backendnek, ahol még ennyi sincs, ezért kézzel kell implementálni hozzá indexet.(*). Ehhez találtam egy nyílt Java-s <a href="http://hub:8080/nexus/index.html">rtree</a> <a href="http://sourceforge.net/projects/jsi/">implementációt</a>. Az rtree nem a leggyorsabb algoritmus, de egy elég jó alap megoldás, ami kezdetnek jó lesz.

(Megjegyzés: *. A kézzel írt kvázi indexelés nagyon jól mutatja a NoSQL lehetőségeit. A NoSQL csoportba sorolt adatbázisok általában sebességben verik a relációs elődöket, de cserébe  kompromiszumokra kell számítani. Egy jól meghízott RDBMS sok olyat is ad, amire nincs is szükségünk, de az is előfordul, hogy a NoSQL kőbalta szintjére saját magunknak kell valami ottani szolgáltatást implementálni. Pl. programozás technikákkal gondoskodni kell, hogy tranzakció nélkül is konzekvensek legyenek az adatok. Ez persze plusz munka is lehet, meg szemlélet váltás is, de onnantól pedig egyedi megoldásra egyedi program jó eséllyel versenyre kelhet egy sokkal komplexebb és okosabb, de általános megoldással).

7. Az RTree implementáció nem rossz alap, de nincs felkészülve külső adattárolókra, márpedig én MongoDB-be szerettem volna tárolni az rtree-t, hogy lekérdezés esetén annak segítségével találjam meg egy adott területen elhelyezkedő összes elemet. Ezért kicsit <a href="http://bitbucket.org/elek/nosqlproto/src/tip/rtree2/">átalakítottam</a>. Az átalakításban alapvetően a gyors eredmény számított, nagyon ráférne egy kis optimalizálása (habár az algoritmus eredetileg a memóriában végzett műveletekre nagyon optimalizálva van, már talán túlságosan is. Pl. az Integer osztályok példányosításának a számára is figyelt az alkotó).

8. Az rtree indexelés remekül lefut. A gond ott van, hogy ha egy meglévő adatbázisra (800ezer bejegyzés) futtatom le, akkor a teljes indexelés 4 órát tartott (persze nincs optimalizálva, hanem egyfolytában a MongoDB-hez fordul). Megoldásként első körben a memóriában rakom össze a fát, és utána perzisztálom. A fa kiszámolása fél percet vesz így igénybe, a perzisztálás másodpercnél hamarabb megvan (34 ezer index rekord)

9. A végső próba úgy néz ki, hogy a <a href="http://wiki.openstreetmap.org/wiki/Josm">JOSM</a> nevű grafikus térkép rajzoló programban átállítom a szerver kiszolgálót a saját megoldásra, ami REST <a href="http://wiki.openstreetmap.org/wiki/API_v0.6">alakú</a> lekérdezéseket küldd, és a válaszban érkező pontokat kirajzolja és szerkeszthetővé teszi. (a visszatöltés jelenleg nem célom). A mostani állapotban azt értem el, hogy ez működik, de csak node-okra (a nagyon optimális rtree sajnos még nem tudja kezelni, hogy létezhet node és way ugyanazzal az id-val), és az attribútumokat nem tárolja még.

10. A <a href="http://bitbucket.org/elek/nosqlproto/src/51261783ee3e/osmserver/">szerver oldal</a> egy JavaEE6-os JAXRS-es alkalmazás. A JAXRS elég könnyen használható, de kell hozzá stabil JAXB-s ráhangoltság. Ott vannak félelmeim, hogy a nagyméretű adatkiszolgálásnál , hogy az eredményt tudja streamelni. Szerintem nem tud, ami miatt féltem kicsit a memóriát, de ezt még meglátjuk, hogy meg akarom-e oldani.

11.A MongoDB-ről néhány személyes élmény a teljesség igénye nélkül
<ul>
	<li>elég kényelmes használni, jó a command line interface-e is</li>
	<li>rendszeresen lelőttem futó db alól a laptopomat (érstd az áram kikapcs akkumulátor nélkül) és elég jól túlélte</li>
	<li>nagy szabadság, hogy nincsen séma benne, és mégis elég jól indexel</li>
	<li>valamilyen O(R)M jellegű mappolás nélkül elég fapad a Java API-val használni. Léteznek ilyenek, de én nem használtam, mert 800ezer rekodrnál már számít mennyit refletionözök. Így viszont elég szegényes.</li>
	<li>Clustert még nem próbáltam, viszont a leírás alapjáns csak master-slave replikációt. (helló, magas rendelekzésreállás, helló). Tulajdonképpen ez az, mi miatt leginkább elfordulok felőle. Bár annyit tud, mint amennyit egy MySQL adna, szóval sokszor elég lehet.</li>
	<li>Egy dokumentum írása atomi művelet. Ez még jól jöhet.</li>
</ul>


A közeljövő feladatai:

* Az rtree implementációt meghackolni, hogy több fajta objektumot is tudjon indexelni
* a nodeok és way-ek attríbutumait is tárolni kéne és a relationokat is kezelni kell
* az Osmosis pluginba beilleszteni az indexelést is
* cassandra backendre is implementáni az interfaceket

MongoDB-n kipróbálni még:
* map reduce algoritmus js-ben írva (bár 1 node-on ugye nem várunk csodát tőle)
* ránézni az ORM-nek megfelelő megoldásokra
* JS API-val kicsit barátkozni

<em>(Biztos kimaradt valami, de most már olyan fáradt vagyok, hogy az elgépeléseket sincs erőm kijavítani. Peace.)</em>
