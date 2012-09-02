---
layout: post
title: Metamodellek
tags:
- jpa2
- liquidform
- metamodel
- mockito
status: publish
type: post
published: true
meta:
  _edit_last: '2'
---
Néha hasznos lenne, hogy ha egy objektum struktúra felépítésére tudnék típusosan hivatkozni.

Nem találtam jobb nevet erre, mint a JPA 2.0 zsargonjából kölcsönzött Metamodel kifejezést, de talán egy példán keresztül világosabb lesz, mire gondolok. Tegyük fel hogy szeretnék egy Java Bean to Java Bean mapper-t, hasonlót a <a href="http://dozer.sourceforge.net/">dozer</a>-hez, csak egyrészt programmatikusan szeretném konfigurálni (nem XML-ből), másrészt én akarom részletesen megmondani, hogy mit másoljon, és csak azt másolja, amit szeretnék.

Tegyük fel, hogy van egy managed JPA entitás struktúránk, amiből szeretnék egy detached változatot, de úgy, hogy én mondom meg, hogy az egyes objektum kapcsolatokból melyik legyen kifejtve és melyik ne. Ezt a vázolt mapper alkalmazással fogom elérni, belemondom, hogy melyik atribútuomkat másolja, és egy adott entitásból egy ugyanolyan detached állapotú osztályhierarchiát másol.

Hogy mit másol, azt megadhatom mondjuk Expression Language szerű kifejezéssekkel. Pl.:

<pre lang="java" line="1">
Mapper m = MapperFactory.create(Partner.class);
m.config("partner.nev");
m.config("partner.cim.varos");
Partner managed = ....
Partner detached = new Parner();
m.copy(managed,detached);
</pre>

És itt szeretném elérni azt, hogy a 2. és a 3. sorban típusosan adhassam meg a másolási szabályokat.

 Jelenleg két ötletem van erre:

<strong>APT</strong>

Az első az, amit a JPA2.0 is alkalmaz. Generálunk meta osztályokat mondjuk PartnerMeta, CimMeta, stb.néven, és azokba begeneráljuk a típusok leírását. Pl.

<pre lang="java" line="1">
Mapper m = MapperFactory.create(Partner.class);
m.config(PartnerMeta.nev);
m.config(PartnerMeta.cim.varos);
</pre>

A JPA2 mondjuk Partner_-nek hívná  metamodel osztályt, és nem lenne rekurzív, tehát a Partner_.cim az nem egy Cim_ a JPA2-ben, ezért a fenti definíciót nem is tudnánk használni. Persze nem egy ördöngősség saját metamodelt kitalálni és az APT eszközzel viszonylag elegánsan lehet generálni ezeket az osztályokat (már ha beszélhetünk eleganciáról bármilyen generált kód esetében): Elég egy jól irányzott jar-t elhelyezni a fordítás idejű classpathba és már generálódnak is az osztályaink (lásd még SPI).

A JPA2 API-ját még nem használtam, de azért idemásolom az íze kedvéért egy <a href="http://weblogs.java.net/blog/lancea/archive/2009/12/15/generating-jpa-20-static-metamodel-classes-using-eclipselink-20-and-n">cikkből</a>, hogy hogy megy ez:

<pre lang="java" line="1">
Root team = cq2.from(Team.class);
cq2.select(team.get(Team_.name)).where(cb.like(team.get(Team_.name), "Longfellow%"));
</pre>

<strong>cglib</strong>

A másik megoldás a futás idejű byte-code generáláshoz vezet. Ezt csinálja pl. a <a href="http://code.google.com/p/liquidform/">liquidform</a>:

<pre lang="java">
Person p = LiquidForm.use(Person.class, "p");
List people = em.createQuery(
    select(p).from(Person.class).as(p).where(like(p.getSurname(), "Smith%")).toString())
    .getResultList();
</pre>

és a <a href="http://mockito.org/">Mockito</a>:

<pre lang="java">
Partner partner = mock(Partner.class);
when(partner.getNev()).thenReturn("valami");
assertEquals("valami",partner.getNev());
</pre>

Látható, hogy egyes függvények paraméter gyanánt egy függvényhívást kapnak (pl. partner.getNev()) és nem a függvény hívás visszatérési értéke az érdekes, hanem maga a hívás, mintha egy metamodel egy elemét adnánk meg.

De hogy lehetséges ez? Nem tudom megállni, hogy ne <a href="http://monkeyisland.pl/2008/12/09/more-of-devoxx-more-on-interfaces/">idézzem</a> a Mockito szerőjét <a href="http://monkeyisland.pl">Szczepan Faber</a>-t:

<blockquote>
...I was asked if Mockito is able to mock concrete classes? The answer is yes, Mockito doesn’t care if you mock an interface or a class. Mockito can do it thanks to primordial voodoo magic only ancient shamans understand these days (you guessed right – it’s the cglib library).
</blockquote>

A <a href="http://cglib.sourceforge.net/">cglib</a> egy futási idejű bytecode generátor, ami az <a href="http://asm.ow2.org/">ASM</a> nevű bytecode manipulátort használja. Gyakorlatilag proxy szerű objektumokat tudunk vele létrehozni, amire mi mondhatjuk meg, hogy az egyes metódusok mit csináljanak. Mindkét megoldás úgy kezdődött, hogy csináltunk egy saját Partner osztályt a Mockito.mock vagy Liquidbase.use factory-val. Na ez az osztály már nem egy rendes Partner, hanem a memóriában összerakott saját bytecode-ból áll.

A mockito ebbe a bytecode-ba azt írja bele, hogy egy ThreadLocal polcra tedd el az adott hívás tényét (pl. partner.getNev meghívodott). Aztán a when metódus már meg se nézi milyen paramétert kapott (partner.getNev() visszatérési értékét), hanem erről a polcról megnézi, hogy épp mi futott le, és ezért már tudja, hogy amikor a mockolt osztályon legközelebb meghívódik a getNev(), akkor mit kell visszaadni. (A when metódus természetesen később hívódik meg, mint a partner.getNev(), mert előszőr a when argumentumait kell kiértékelni).

A liquidform ennél kicsit egyszerűbbet utat választott. A partner.getNev() meghívásakor ő is feljegyzi, hogy milyen hívás történik éppen, és visszaad egy visszatérési típusnak megfelelő objektumot, de előszőr egy globális Map-ben a kettőt összerendelni. A like(p.getNev(), "Smith%") metódust ezért érdeklik a visszatérési értékek, mert ez alapján megkeresi, hogy a Map-ben van-e rá bejegyzés, és ha van, akkor onnan kimatekolja, hogy a p.nev értéket kell berakni majd String szinten a készülő Querybe.

A liquidform megoldásának azonban van egy nagy hátránya: nem tud primitív típusokat kezelni. Mivel a Map-ben létező objektum referenciákra tudja megmondani az elérési utat, ezért egy visszaadott long értékkel nem tud mit kezelni. Persze meg lehetne a liquidformot is okosítani a Mockito módszerével, de akkor egy másik  problémába ütközünk. A like(p.getNev(), "Smith%") híváskor a polcon az szerepel, hogy egy pszeudó hívás érkezett a bytecode lekvárunkba, aki ezt gondosan feljegyezte. Majd ez után kapunk két String paramétert. Hogy melyik String paramétert kell feloldani a polcunkon lévő hívási információból, azt csak akkor tudnánk megmondani, hogy ha egy kitűntetett String értéket lefoglalnánk annak a jelzésére, hogy az a visszatérési érték nem számít, ehelyett használd a polcon lévő hívási információt. Másik lehetőség, hogy ha a paraméterek minden esetben felcserélhetők, akkor azt mondjuk, hogy a metamodeles hívás mindig az első kell, hogy legyen.

Hát itt tartok éppen a gondolataimban.
