---
layout: post
title: openjpa:sql
tags:
- JPA
- openjpa
status: publish
type: post
published: true
meta:
  _edit_last: '2'
---
A probléma: a JPA entitás struktúra folyamatosan fejlődik. Bármikor képes szeretnék lenni az entitásoknak megfelelő adatbázis struktúrát létrehozni, illetve egy meglévő adatbázis struktúrát minél kevesebb adatvesztéssel frissíteni.

Az első követelményt szinte minden JPA provider tudja, a második viszont már keményebb dió. Az Eclipselink pl. csak a drop-and-create szolgáltatást ajánlja, azaz törli az összes táblámat, és újra létrehozza a sémát, még akkor is, ha csak egy új mezőt, vagy egy új táblát hoztam létre.

Az openjpa viszont még az én igényeimet is kielégíti. Erre egyrészt ad egy <a href="http://openjpa.apache.org/builds/1.0.2/apache-openjpa-1.0.2/docs/manual/ref_guide_mapping.html#ref_guide_mapping_mappingtool">Java osztály</a>t, de van hozzá <a href="http://mojo.codehaus.org/openjpa-maven-plugin/">Maven plugin</a> is. Megnézi az entitásaimat és tud generálni belőle create DDL-t, illetve refresh-t is, azaz egy meglévő adatbázishoz képest a különbséget. Az adatbázis kapcsolatot a persistence.xml-ből veszi, vagy konzol paraméterből is megadható. Az SQL parancsokat kiírja fájlba, vagy rögtön frissíti/létrehozza az adatbázist is. Elvileg ugyanerre be lehet konfigurálni a Persistence Unitot is, de azt még nem próbáltam ki.

Az első próbák ígéretesek. Új oszlopot, táblát felvesz anélkül, hogy a többit törölné. Ha mezőt törlök, akkor persze nem törli a megfelelő mezőt, de ezt akár tervezési döntésnek is be tudhatjuk.

Nekünk volt erre egy sufni toolunk régen, ami felépítésében sokat ígérő volt, de persze a JPA-ból csak a triviális dolgokat implementáltuk, most viszont ez úgy tűnik el lehet dobni, mert az openjpa jó lesz minderre. Lehet hogy providerként is megpróbálkozom vele.
