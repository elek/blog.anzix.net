---
layout: post
title: Spring plugin framework
tags: [spring modul jpf]
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2006/07/spring-plugin-framework.html
---
Régóta foglalkoztat a kérdése, hogy hogy lehet a Spring frameworkből (j2ee
használat esetén) valami modulláris-pluginos cuccot csinálni. (Mondjuk mint a
[JPF](http://jpf.sourceforge.net/), aminek meg az Eclipse a mintája).

  
Most a [TSS](http://www.theserverside.com/news/thread.tss?thread_id=41298)
linkelt be egy [cikket](http://www.devx.com/Java/Article/31835). Ami
lightweight pluginekről beszél spring alatt.

  
A tehcnika röviden:

  
class betöltés: j2ee esetén azt tanácsolja, hogy dobjunk be mindent a WEB-INF
/lib-be, és akkor nem kell velel foglalkozni, hogy mi töltődik be. Standalone
app esetén egy ant build fájlt használ indításra. Az ant classpath megadásánál
ugyanis lehet * wildcardot használni.

  
A j2ee-s változattal csupán az a bajom, hogy a modulr kódja és a függőségei
összekeverednek egymással. Ha egy-egy modulomnak 5-10 jar függősége van, akkor
nehéz lesz kihámozni a lib könyvtárból, hogy mi a függőség, és mi a modul.

  
Viszont az kétségkívül előnye, hogy könnyen meg lehet emiatt oldani a több
modul -- ugyanaz a függőség problémát. Lehet hogy valami fájlleíróval a
függőségeket is szimpla modulként kéne kezelni.

  
spring bean építés: a bean-ek külön fájlokba helyezése sose volt probléma. A
Spring remekül támogatja, hogy ne egy bean fájlt, hanem sok kicsit olvasson
be.

  
hook rendszer: A kiterjeszthetőség elég izgalmas: Hook meghirdetése
gyakorlatilag egy szimpla bean-nel történik, aminek a List típusú paramétereit
üresen hagyja. Hook regisztrálása egy *BeanFactoryPostProcessor* leszármazottal
történik (emiatt az xml-el feldolgozása után, de a bean-ek létrehozása előtt
kerülnek ezek a beanek meghívásra). És ezeknek a bean-eknek a konstruktorába
szépen a meghirdetett beanek üres paramétereit kitölti a saját praméterei
alapján. (Nem tudom nem gáz-e, hogy ha sok ilyen kiterjesztést akarunk
regisztrálni, akkor tele leszünk, felesleges objektumokkal a memóriában. EZek
az objektumok csak regisztráláskor fontosak).

  
A TSS cikke után viszont izgalmas hozzászólások vannak, egyéb
megoldásokra.Eddig csak az [el4j](http://el4j.sourceforge.net/)-t néztem.
Lehet hogy én vagyok nagyon nehéz felfogású, de én még egy kicsit több
doksira, és step-by-step tutorialokra vágynám, hogy teljesen átlássam a
dolgokat.`

