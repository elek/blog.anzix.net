---
layout: post
title: Guice kísérlet
tags:
- projekt
- test
- unitils
status: publish
type: post
published: true
meta:
  _edit_last: '2'
---
Van egy régi projektünk a cégnél, egy EJB3-at tesztelő <a href="http://www.unitils.org/">Unitils</a> modul (nemrég kijött a Unitils 1.1, ami JPA-t támogat, de a mienk a beaneket is injektáltja, igaz, csak annyira van implementálva, amennyire nekünk kellett).

Ezt használva körülbelűl így néz ki egy tesztünk:

<pre lang="java">
@RunWith(UnitilsJUnit4TestClassRunner.class)
public class EJBInjectionTest {

@EJB
SampleSessionLocal bean;

@Test
public void testSessionBeanInjected() {

}

}
</pre>

Azaz a teszt futása előtt injektálja a példányosított EJB-t, valamit az EJB-be is injektálja a függőségeket az EJB specifikáció szerint. (Mint már írtam, korántsem teljes implementáció.) Pazar cucc, megy is annyira, amennyire nekem kell.

Régi álmom volt azonban, hogy egyszer annyira összepofozzam, hogy kiadható legyen. Az volt a terv, hogy az injektálásokhoz Google Guice-t fogok használni, mert már rég akartam vele foglalkozni. Egyszer már át is futottam a doksiját, és úgy tűnt minden megoldható benne.

Most azonban, ahogy nekiveselkedtem, határozottan úgy érzem, hogy a Guice alkalmatlan lesz a feladatra. Azt akarom elérni, hogyműködjön mondjuk egy ilyen:

<pre lang="java">
@PersistenceContext(unitName="Test2PU")
EntityManager em2;
</pre>

Sajnos azonban a Modul összeállításakor sehogy sem tudok hozzáférni az annotáció paraméteréhez:

<pre lang="java">
binder.bind(EntityManager.class).annotatedWith(PersistenceContext.class).toProvider(new EntityManagerProvider(directory, null));</pre>
