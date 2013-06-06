---
layout: post
title: Wicket + IoC
tags:
   - wicket
   - guice
---
Ha wicketben elnavigálunk egy statfull oldalról, akkor azt a keretrendszer leserializálja és elrakja. Ha az új oldalról mondjuk a backkel visszamegyünk, akkor az előző oldal példányt vissza serializálja és azt rendereli le. Ha azonban a serializálás közben egy nem serializálható mezőt talála az oldal objektumon, akkor dob egy kivételt (nem a felületen, csak az alkalmazás szerver logjában), és amikor vissza akarunk térni, már csak egy Page Expired oldal fogad.

A Wicket és az IoC kapcsolódási pontja az IComponentInstantiationListener osztály. A beregisztrált listenerek minden komponens létrehozásakor meghívódnak a Component osztály konstruktorában. Mivel a leszármaztatott komponensben első lépésben meghívjuk a szülő osztály konstruktorát, ezért ha egy beregisztrált listener injektál az annotált mezőkebe, akkor azoknak értéke már a konstruktorban elérhető. Ilyen okos konstruktor, azonban csak a Component osztályban van, a Model-ek és DataProviderekben nem.

Van még egy másik dolog, ami a Wicketben alap, hogy a Model-ek egy jó része Detachable, azaz az oldal elrakásakor nem serializálódik úgy ahogy van, hanem csak a fontos mezők kerülnek elmentésre. Ezzel csökkenthető az állapot által elfoglalt hely nagysága. Tipikusan pl. ha egy model egy JPA entitást tárol, akkor elég elrakáskor a primary key-t elrakni, és amikor a komponens fát előhúzza a wicket, akkor az Id alapján újra betölti az entitás az adatbázisból. Már ha éppen kéznél van a Modelben egy EntityManager. ServiceLocator.getInstance() típusú trükkel mindenhol kéznél lehet, de IoC-vel már bonyolultabb a probléma, mert az EntityManager nem serializálható, és a jól beinjektált objektumot nem tudja elserializálni a wicket. Ha meg transient, akkor a Modelt elserializálja, de elővétel után az EntityManager helyett egy nagy null lesz.

Mi a megoldás? A wicket-guice azt csinálja, hogy egy un. LazyInitProxy-t használ. Ez a nevének megfelelően egy olyan proxy, ami az első híváskor inicializál a hasába egy adott osztályt, amihez majd híváskor proxyzza a kérést. A wicket-guice amikor a Component-ekbe kéne injektálnia, nem az Guice-os Injectort használja, hanem kézzel végig szánkázik a potenciális injektálandó mezőkön, és ahová injektálni kell, oda ő injektál egy proxy-t, amibe belírja a cél mező típusát és a rajta lévő annotációt. A proxy tehát tudja ezt a két értéket, ami már elég kulcs, hogy szükség esetén ez alapján az Injectortól elkérje a megfelelő példányt, aminek tovább kell adni a kérést. És persze a csak mező és annotáció típust hordozó proxy szerű objektum vidáman serializálható.

Ezzel a trükkel a Component szinten lévő @Injectálandó szolgáltatások helyére egy speciális serializálható referencia kerül. Viszont az ily módon beinjektált osztály által hivatkozott szolgáltatók már hagyományos Guice IoC szinten jönnek létre.

A megoldás tehát az, hogy a Page-ekbe rakunk @Inject-eket, és a Modelek és DataProviderek megkapják konstruktor paraméterbe a beinjektált szolgáltatásokat, hiszen mi tudjuk, hogy első szinten azok serializálható visszatölthető referenciák.

Ha wicketben elnavigálunk egy statfull oldalról, akkor azt a keretrendszer leserializálja és elrakja. Ha az új oldalról mondjuk a backkel visszamegyünk, akkor az előző oldal példányt vissza serializálja és azt rendereli le. Ha azonban a serializálás közben egy nem serializálható mezőt talál az oldal objektumon, akkor dob egy kivételt (nem a felületen, csak az alkalmazás szerver logjában), és amikor vissza akarunk térni, már csak egy Page Expired oldal fogad.

A Wicket és az IoC kapcsolódási pontja az IComponentInstantiationListener osztály. A beregisztrált listenerek minden komponens létrehozásakor meghívódnak a Component osztály konstruktorában. Mivel a leszármaztatott komponensben első lépésben meghívjuk a szülő osztály konstruktorát, ezért ha egy beregisztrált guice-os listener injektál az annotált mezőkebe, akkor azoknak értéke már a konstruktorban elérhető lesz. Ilyen okos konstruktor, azonban csak a Component osztályban van, a Model-ek és DataProviderekben nem.

Van még egy másik dolog, amire épül a Wicket, hogy a Model-ek egy jó része Detachable, azaz az oldal elrakásakor nem serializálódik úgy ahogy van, hanem csak a fontos mezők kerülnek elmentésre (hogy mi fontos, azt mi implementáljuk). Ezzel csökkenthető az oldal állapotok által elfoglalt hely nagysága. Tipikusan pl. ha egy model egy JPA entitást tárol, akkor elég elrakáskor a primary key-t elrakni, és amikor a komponens fát előhúzza a wicket, akkor az Id alapján újra betölti az entitást az adatbázisból. 

Már ha éppen kéznél van a Modelben egy EntityManager. ServiceLocator.getInstance() típusú trükkel mindenhol kéznél lehet, de IoC-vel már bonyolultabb a probléma, mert az EntityManager nem serializálható, és a jól beinjektált objektumot nem tudja elserializálni a wicket. Ha meg transient, akkor a Modelt el tudja serializálni, de elővétel után az EntityManager helyett egy nagy null lesz, mert elővételkor nem fut le a Listener, hogy injektáljon.

Mi a megoldás? A wicket-guice azt csinálja, hogy egy un. LazyInitProxy-t használ. Ez a nevének megfelelően egy olyan proxy, ami az első híváskor inicializál a hasába egy adott osztályt, amihez majd híváskor proxyzza a kérést. A wicket-guice amikor a Component-ekbe kéne injektálnia, nem az Guice-os Injectort használja, hanem kézzel végig szánkázik a potenciális injektálandó mezőkön, és ahová injektálni kell, oda ő injektál egy proxy-t, amibe belírja a cél mező típusát és a rajta lévő annotációt. A proxy tehát tudja ezt a két értéket, ami már elég kulcs, hogy szükség esetén ez alapján az Injectortól elkérje a megfelelő példányt, aminek tovább kell adni a kérést. És persze a csak mező és annotáció típust hordozó proxy szerű objektum vidáman serializálható.

Ezzel a trükkel a Component szinten lévő @Injectálandó szolgáltatások helyére egy speciális serializálható referencia kerül. Viszont az ily módon beinjektált osztály által hivatkozott szolgáltatók már hagyományos Guice IoC szinten jönnek létre.

A megoldás tehát az, hogy a Page-ekbe rakunk @Inject-eket, és a Modelek és DataProviderek megkapják konstruktor paraméterbe a beinjektált szolgáltatásokat, hiszen mi tudjuk, hogy első szinten azok serializálható visszatölthető referenciák.

<em>PS: kitakarítottam a commentek közül az 500 spamet, találtam három értékes kommentet (miért nem kaptam róluk emailt??), amire mindjárt válaszolok. kicsit újra rendet raktam itt. Jól megült itt a por, mióta utoljára itt jártam.</em>
