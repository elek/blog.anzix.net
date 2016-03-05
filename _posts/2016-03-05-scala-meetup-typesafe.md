---
title: Scala Meetup 2016.03
layout: post
author: elek
type: dpc
tags:
  - scala
  - patternmatching
---

Hosszú idő után újra volt [Scala meetup][meetup] Budapesten. (Mármint előadós fajta, mert pair programozós fajta [szokott lenni][reggeli] sűrűbben is.

Az apropó az volt, hogy a Typesafe/Lighbend különítménye épp Budapesten találkozott.

Az előadások:

## Reactive Microservices by Christopher Hunt 

Az előadás a szokásos reactive mantrákkal kezdődött ("without resilience nothing matters"). Néztünk egy átlagosnak tűnő microservice alkalmazást (Play, REST, Postgres) amin a kis fűszer csak a cache-elés volt. Viszont rögtön elképzeltük, hogy a cache bizony mennyire problematikus lesz, ha három példány futna az alkalmazásból (ugye ha bármelyik példány írna az adatbázisba, az összes cache-t invalidálni kell.

Aztán az egyszerűség kedvéért (sic!) hogy ne kelljen mondjuk egy message brokert telepítenünk, elkezdtünk használni egy akka clustert és egy postgresql clustert is.

Aztán a hasonló elveken működő [conductr][conductr]-t vettük szemügyre. Ez alapvetően egy agent, ami minden gépen fut és (micsoda véletlen) egy Akka clustert alakítanak ki a node-ok és segítenek deployolni.

* Az akka clusterben benne van minden service adata (service discovery)
* HA-proxy segítségével (aminek a configját dinamikusan konfigurálja) api gateway funkciót is tud
* Command line interface-e van, ami állítólag az elejétől fogva arra lett kitalálva, hogy könnyen használható legyen.
* Alapvetően az "indíts el nekem 3 példány ebből a verzióból ahol van rá még erőforrás" típusú dolog.
* Web interface is van hogy lássuk, hogy mi hol indult el.
* Elvileg tool független (dockert/java-t/bármit támogat)

Az érzéseim kicsit vegyesek voltak. Egyrészt az előadásból nem nagyon derült ki, hogy miért lenne meggyőzőbb mint bármi más (aztán beszélgetve utána [@huntchr][huntchr]-rel azért jobban árnyalódott a kép). Kérdésre válaszolva (miért jobb mint egy docker swarm) azt felelte, hogy már most sok tool van, ezért az igény valid, és majd meglátjuk melyik a jobb.

Ráadásul az volt egy példa, hogy mivel a közös loggolás (minden instance logja egy helyen legyen) nagyon fontos, ezért beépítve van benne elasticsearch cluster. Persze ez eszi a memóriát ezért elkezdtek épp csinálni egy elasticsearch api-t emuláló in-memory lightweight valamit. Na ez szerintem tipikusan az, amikor hozunk egy rossz döntést (mindenképpen legyen benne elastic search a közös logra), aztán próbáljuk menteni a helyzetet. Én pl. arra szavaznék, hogy mindenki maga döntse el, hogy hogyan akar közös logot. Igen az elasticsearch egy jó megoldás, de még van más is (pl. valami felhő alapú mint pl. a logentries).

Azon kívül ha összehasonlítjuk a Netflix/Spring cloud stack-kel azért látszik, hogy annak elég erős feature setje van egy conductr-el szemben. (Pl. ribbon/client side load balancer). Nehéz a Spring ökoszisztémájával versenyezni, utolérni. Viszont az teljesen igaz, hogy azt a kérdést, hogy hogy jutnak el a Spring boot jarok a környezetekbe és hogy indulnak el Spring Cloud jelenleg nem oldja meg, és a conductr-ben az az újdonság, hogy a deploy tool össze van növesztve a service registryvel és már deploy time használhatjuk az adatokat, ami kétség kívül egy jó irány lehet.

((Meg persze ha egyszer a Scala-sok kezében ott van az Akka, akkor előbb utóbb várható, hogy mindenki épít belőle egy clustert.))

Mindenesetre meglátjuk mi lesz. A Spring cloud most afelé halad, hogy a service registry/config service is cserélhető legyen (alakulnak a consul.io, zookeeper implementációk is a meglévők Netflix/Spring-es mellé), ami elég erős ígéret, de a deployra tényleg kell valami válasz (ami akár lehet valami 3rd party tool is). 

## Lutz Hühnken: Everything You Always Wanted to Know About Pattern Matching

Ez viszont egy klasszikus command line-os pattern matching előadás volt. Az alapoktól kezdve haladóbb témákig (name based extractors, unapplySeq, stb.). Nagyon jól összeszedett előadás volt, volt remek íve és szerintem kezdők/haladók egyaránt találtak benne izgalmasat. (Eleve scala compiler debug kimenetével illusztrálni a dolgokat elég meggyőző...). Ilyen előadást meghallgatnék még sok más topicban is.
 
A "slide"-ok [itt][slides] elérhetőek. ([replesent][replesent]-ben kell futtatni)


[meetup]: http://www.meetup.com/budapest-scala/events/229090152/
[reggeli]: http://www.meetup.com/Scala-Pair-Programming-Breakfast-Budapest/
[conductr]: https://conductr.lightbend.com/
[huntchr]: https://twitter.com/huntchr
[slides]: https://github.com/lutzh/pattern-matching-talk/blob/master/pattern-matching.txt
[replesent]: https://github.com/marconilanna/REPLesent
