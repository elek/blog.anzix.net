---
title: Microservices (JUM)
layout: post
author: elek
type: dpc
---

A tegnapi JUM-on két előadás is szólt a microservice-ekről. Az első egy általánosabb bevezető volt (Peter Boon - The Theory of Microservices), a második egy tehnológiai megvalósítást mutatott meg (Norbert Sram - Java in the land of microservices ).

Az előadások érdekesek voltak, de több olyan dolog is előjött, amik szerintem pontosításra szorulhatnak. Az alábbi szövegben a címek általában az előadásból/prezentációból valók, alatta a kommentjeim.

## [Microservice is] "Architectural style without formal definition"

Ez a (nem)definíció rögtön szimpatikus volt, mert nem húzza túl szorosra a határt. Számomra ugyanis az az érdekes, hogy hol húzzuk meg a határt a microservice-ek és a monolit alkalmazások között. A kettő között ugyanis ott vannak még valahol a moduláris alkalmazásaink is, bár mintha ezt ritkán vennénk észre.

A prezentációban pl. a jellemzők nagy része gond nélkül ráhúzható lett volna egy moduláris alkalmazásra is. (A _distributed_ szó emlékeim szerint nem szerepelt, csak a _network latency_ jelent meg később mint hátrány.)

Egy kicsit azt gondolom, hogy az esetek jó részében csak modularitástra van szükségünk, és miközben ezt keressük megkapjuk a microservice-ek vagy az OSGi komplexitását is.

## "SOA != Microservices"

A másik nagy kedvencem, amikor gondosan elhatárolódunk a SOA-tól. Persze értem én, sajnos a nagy enterprise termékek ugyancsak lejáratták a SOA szót, és ha a SOA számunka végtelen sok WSDL, akkor tényleg nem ugyanaz.

Az előadás második felében azonban rögtön előjött az interface-ek verzózásának kérdése (nem  így volt megfogalmazva, de erről volt szó), és ha elkezdünk microservice-eket gyártani, akkor előbb utóbb nagyon hasonló kérdésekkel fogunk találkozni, mint egy SOA architektúrában.

A SOA démonizálása helyett inkább tanulni kéne belőle, mert ha őszintén összehasonlítanánk a kettőt, nagyon sok párhuzamosságot találnánk... 

Persze SOA v2 néven nehéz lenne eladni...

## Teknősök

A második részben egy példát láthattunk microservice architektúrára. A példa egy teknősbékákat figyelő alkalmazás megvalósítása volt (kamera, hőmérséklet, stb.).

Persze azt értettük, hogy egy ilyen kis (RPi-n futú alkalmazás) megvalósításához valószínűleg a microservices architektúra pont nem annyira ideális, ez inkább csak kísérlet, tanuló projekt volt.

De amellett, hogy valószínű jobb lett volna valami életszagúbb példa itt is előjön a kérdés, hogy hol az a komplexitás, amikor már megéri microservice-eket használni. (Lásd még Fowler bácsit [itt][1] és [itt][2], valamit az ellenvéleményt [itt][3].)

Ez egyik slideon például fel voltak sorolva a nevek, hogy kik használják (Amazon, Google, NetFlix, stb.), de nekik vélhetően teljesen más problémájuk van mint egy átlagos backend-frontend webalkalmazásnak. 

Hasonló a helyzet mint a NoSQL-nél: sokszor sok innováció/trend a nagy startup cégektől ered, és előfordul, hogy az ő környezetükben bevált problémákat gondolkodás nélkül alkalmazni akarják minden más környezetben is.

(Figyelem, nem azt állítom, hogy ezek nem alkalmazhatóak. Pl. szerintem egy schema-free MongoDB sok esetben egy-szerveres környeteben is sokkal hasznosabb, mint egy SQL szerver. De pl. egy Cassandráról ezt nem állítanám)

## "DRY or RY?"

Az állítás az volt, hogy a jó öreg _Don't Repeat Yourself_ már érvényét vesztette, és inkább implementáljunk mindent többször le a különböző service-ekbe. Például ne optimalizáljuk ki temp.jar-ba a hőmérséklet kezelő dolgokat, mert akkor túl nagy függőség lesz a microservice-eink között, hiszen több komponens is ugyanattól a jar-tól függene.

Szerencsére ez a mondás a kérdések alatt kicsit szelidült arra, hogy a utilityket azért megoszthatjuk. (Anélkül elég furcsa lenne, hogy a hibernate.jar-t használhatja több komponens, a temp.jar-t meg nem???)

A problémát alapvetően értem, attól féltünk, hogy ha az egyik komponens már más fajta adatot vár (közös POJO megváltozik a protokolban), akkor sok service-t újra kell deployolni. 

De azért nézünk szét a világban. Olyat, hogy service interface-ek változnak, olyat már láttunk sokat (helló SOA) és eddig is valahogy megoldottuk a problémát (pl. lehet visszafelé kompatibilis változtatásokat tűrő protokolt használni). Meg azt is, hogy különböző verziójú függőségei vannak különböző service-eknek.

És igen, az is lehet _egy eszköz a sok közül_, hogy duplikálunk bizonyos kódokat, de én nem merném kijelenteni, hogy az egyetlen út és a DIY-nek vége a microservice világban.

## "if multiple services access the same database, not doing microservices"

Ez is elhangzott mindkét előadásban. És ismét csak az a helyzet, hogy értem a mögöttes gondolatot (ha azonos sémát használunk, akkor az egy nagyon erős függőség két komponens között, amik függetlenek akartak volna lenni.), de a világ ennél azért összetettebb.

Példul a slideok-on valami miatt csak relációs adatbázis példák voltak (és a JOIN volt a probléma). Mi a helyzet pl. a MongoDB-vel, ahol a liberális sémakezelés miatt ez a függőség sokkal kissebb?

Mi a helyzet egy CouchDB-vel? Nem tekinthető-e az egész adatbázis úgy mint egy külön service, amit a HTTP REST API-n bárki elérhet?

És ha a CouchDB tekinthető, akkor ha a protokol nem HTTP, akkor ott miért nem? 

Ismétlem: értem, hogy a függőségekről akartunk beszélni, de én -- talán nem vagyok elég bátor -- nem mernék ennek örvén olyan szabályokat megfogalmazni, ami sok esetben nem biztos hogy feltétel nélkül követendő.

## Összefoglalás

__Az emberiség nagy részének nem microservice-ekre van szüksége, hanem moduláris alkalmazásokra.__ Moduláris alkalmazást lehet microservice architekturával és máshogy is csinálni, és van amikor a microservice-ek elosztott tulajdonságaira is szükség van.

De már előre rettegek attól, hogy mennyi kontár kód fog születni a (félreértelmezett) microservice trend zászlaja alatt.


[1]: http://martinfowler.com/bliki/MicroservicePremium.html
[2]: http://martinfowler.com/bliki/MonolithFirst.html
[3]: http://martinfowler.com/articles/dont-start-monolith.html
