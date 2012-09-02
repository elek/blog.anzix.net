---
layout: post
title: Maven vs. scripting
tags:
- JPA
- jsr223
- maven
- rhino
- scripting
status: publish
type: post
published: true
meta:
  _edit_last: '2'
---
Van egy régi félkész projekt, ami az előző munkánkból potyogott ki, mint újrahasznosítható alkatrész. A központi része egy absztrakt adatbázisséma reprezentáció Java osztályokból. Ezt az absztrakt fát fel lehet építeni többfajta forrásból (pl. Oracle DB connection alapján leképezi egy meglévő DB felépítését, vagy egy Jar-t megadva leképezi a Jpa entitások által meghatározott sémát az absztrakt adatbázis sémává). Természetesen az absztrakt DB sémát ki is lehet iratni (célszerűen mindenféle adatbázis specifikus SQLé). Illetve egy eszköz meg tudja mondani két sémadefiníció különbségét, és azt is le tudja képezni SQL parancsokká.

Mire jó? Mi két dologra használtuk. Egyrészt a JPA osztályokból előállítottuk azokat a fájlokat, amikben az SQL parancsok voltak, amivel a sémát fel tudtuk építeni. Ez már csak a Unitils-es teszt környezetünk miatt is kellett, ami, ha érezte, hogy az SQL-ek megváltoztak, a teszt adatbázist rögtön törölte, és felépített egy teljesen új adatbázist. Másrészt a fejlesztési adatbázist is tudta frissíteni, mert beolvasta a jelenlegi sémát (Oracle system táblákból), és az új sémát (JPA osztályokból), összehasonlította a kettőt, és a különbséget SQLben mondta el. Így a fejlesztési adatbázist (és akár az éleset is) tudtuk inkrementálisan frissíteni, úgy hogy a meglévő tartalom ne vesszen el.

Most jön a lényeg. A projektet kicsit kipofoztam múltkoriban, és már ott tartok, hogy csináljak hozzá ANT taskot és Maven plugint. Azon gondolkoztam, hogy hogyan tudnám a konfigurálhatóságot úgy megragadni, hogy az egyes elemeket bármilyen párosításban lehessen használni. Bárhonnan tudjak sémát beolvasni (létező Oracle vagy Mysql séma, JPA osztályok), és bármit meg tudjak velük csinálni (Mysql vagy Oracle specifikus kiiratás, összehasonlítás különbség számítás).

Arra gondoltam, hogy a legrugalmasabb az lenne, ha nem az XMLen kéne erőszakot tenni, hanem mondjuk valami scrip nyelvel lehetne megfogalmazi, hogy mit akarok, és milyen összetételben.Az első tesztek szerint a JSR-223 teljesen jó megoldást adna, mindenki abban írhatná meg a logikát, amiben akarná, akinek meg mindegy, annak ott az alapértelmezésben is elérhető JavaScript motor a Rhino. Ez utóbbival (a még teljesen átgondolatlan API) valahogy így föst:
<blockquote>new DDLWriter();.generateDDL(new JPAReader("target/test-classes").readDefinition()).printAll();</blockquote>
Az elképzelés az, hogy csinálok egy Maven plugint, amibe ezt bele lehet írni konfigurációként. Persze ez rögtön általános Maven plugin lenne, amibe bármit lehetne írni bármilyen JSR-233az script nyelv segítsévégel. Akár már létezhetne is ilyen plugin (rákerestem, nem találtam), amivel ha mást nem a Maven kicsit merev logikáján és deklaratív eszméjén sikerülne rést ütni. Valahogy úgy mint az antrun plugin, csak itt ráadásul scripteket lehetne írni ANT XML részletek helyett.

És itt, hogy ne nyúljak túl hosszúra, inkább <a href="http://monkeyisland.pl">Szczepan Faber</a>-t a <a href="http://code.google.com/p/mockito/">Mockito</a> szerzőjét idéznem:<a href="http://monkeyisland.pl">
</a>
<blockquote>"After Jason Van Zyl’s session I had an impression that he believes the best fit for the build system is a declarative architecture. I tend to disagree and I believe the build has inherent scripting nature."</blockquote>
