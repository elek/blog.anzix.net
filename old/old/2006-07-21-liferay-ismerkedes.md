---
layout: post
title: Liferay ismerkedés
tags: []
status: publish
type: post
published: true
---
Szóval keresek egy portálrendszert, ami: ingyenes, moduláris, könnyen
bővíthető, viszonylag vállalható architektúrájú.

Ennek keretében nyomogattam egy kicsit a Liferay-t. Első tapasztalatok.

1. Nem tudom miért, de ezzel is az az érzésem, hogy fejlesztők azt mondják,
hogy jó jó az OS, de a dokumentációt nem visszük túlzásba, hogy a supportba
visszacsöpögjön valami. Mert vagy én vagyok nagyon hülye, vagy tényleg egy
kicsit kevés a dokumentáció.

Senki nem szólt pl. hogy linux alatt léteznie kell egy /home/liferay-nek,
ahová tudjon írni a portál, különben exception-ökkel elszáll.

(Külön izgalmas, hogy ha dokumentációt keresek az oldalon, akkor azzal kell
szembesülnöm, hogy én nem felhasználó vagyok, hanem developer. A developer
zone alatt vannak a doksik, és a developer doc tartalmaz egy sokkal
részletesebb install leírást, mint az user guide.)

2. Ami izgalmas volt számomra, az a portlet alapú működés. Eddig is tudtam a
portletekről, de még sose láttam a gyakorlatban, hogy hogy megy. A Liferay
nagyon szép példa volt. Teljesen más gondolkodás mód mint amit megszoktam. A
kis CMS-ek általában úgy működnek, hogy van egy url, és az alatt egy funkció
(hírek, képgaléria, stb.). És ha nagyon kell, akkor blokkokat nyomhatok a fő
tartalmak köré. (Szerencsés esetben megadhatom, hogy a blokkok mikor ne,
illetve mikor látszódjanak).

Itt teljesen máshogy van. Van egy url, és az egy tiszta lap. Ebbe dobálhatom
bele a portleteket (blokkokat). Mindegyik lapra külön beállíthatom, hány
hasábos legyen, és hogy portleteket dobálok bele, vagy mondjuk IFRAME-es
legyen.

A portleteket külön lehet konfigurálni, viszont ha egy oldal egyik
portletjének egy aloldalára szeretnék menni, akkor az teljes képbe bejön, és
eltűnik minden más az oldalról, pedig lehet, hogy néhány blokkot én továbbra
is láttatni szeretnék.

3. A Liferay4.0-val szállított portletek szerintem elég halványak. Pl. az
Image galery elég szánalmas. Ezért inkább egy jó keretrendszernek tűnik
(legalábbis azt nem néztem) de a hozzáadott dolgok egy kicsit fapadosak, kevés
dolgot lehet konfigurálni rajtuk.

4. Néhány megjegyzés még:

* My places alá helyet új community felvételével lehet csinálni.
* Ha utáljuk az alap demó adatbázist, akkor első körben a web.inf-ben kell a company_id-t megváltoztatni. (Gondolom az adatbázisban a sok szemét még megmarad, de legalább üresen lehet tesztelni.)
* Az többnyelvű tartalmakat nem tudom elérni, mert amit a csilli villi lifecat tutorial mutat, az az üres adatbázisban nálam nem elérhető, és a doksi mélyen hallgat, hogy hogy kell bekapcsolni.
* Azt hogy egy oldal hány oszlopos legye, az új portletet hozzáadó oldalsávban lehet beállítani. 

