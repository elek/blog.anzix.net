---
title: "OSGi és classloderek"
tag:
   - OSGi
   - classloader
layout: post
type: dpc
---

Ha alapokról kellene elkezdeni az OSGi működését -- mondjuk egy tanfolyam keretében -- akkor biztos, hogy még mielőtt bármit elmondanánk, a classloaderek működését kéne megértetni. Igazából meglehetősen egyszerűek a szabályok, de jó tudatosítani őket. Ha nem ismerjük a szabályokat, az OSGi konténerünk változatos ClassNotFound exception-ök dzsungelévé tud válni. De ha tudjuk mi hogy működik, elég egyszerű rátalálni az ösvényre.

**Kérdés**: Milyen classloader fogja betölteni az osztályunkat, ha eddig még nem volt betöltve, de a kódunkban valahol szerepel a ```new MyClass()``` kifejezés.

**Válasz**: Az a classloader, aki azt a kódot töltötte be, ahol példányosítani próbálunk.

### 1. Példa

Tegyük fel, hogy van 2 bundle-unk a konténerben (legyen mondjuk a nevük *service* és *client*). 

A *service* tartalma:

 * ```hu.dpc.demo.osgi.util.FactoryUtil``` class
     * ```createAccount``` metódus, ami létrehoz egy Account-ot.
 * ```hu.dpc.demo.osgi.util.Account``` class
 * Megfelelő bejegyzések a ```META-INF/MANIFEST.MF```-ben
     * ```Export-Package: hu.dpc.demo.osgi.util```

A *client* tartalma:

* ```BundleActivator``` implementáció, ami létrehoz egy ```FactoryUtil```-t és meghívja a ```createAccount``` metódust.
* Megfelelő bejegyzések a ```META-INF/MANIFEST.MF```-ben
    * ```Import-Package: hu.dpc.demo.osgi.util```

Ebben eddig semmi meglepő nincs. Tudjuk, hogy az OSGi bundle egy sima jar file, ami attól érzi magasabb rendűnek magát, hogy a MANIFEST-ben okos mondásokat tartalmaz. A service például megengedi, hogy  a ```hu.dpc.demo.osgi.util``` csomag alatt található osztályokat bárki lássa, *aki szeretné.*. Az igényt az ```Import-Package``` mondással jelenti be a client bundle.

Két class loaderünk lesz tehát, mindegyik bundle-nak egy. Ha a *client*ben valami nem található, a *service* classloadere is az exportált packagekből adhat osztályokat. Ha a BundleActivator-ban (ami esetünkben kb. olyan mint a main) meghívjuk a ```new FactoryUtil()``` konstruktor, akkor mivel a saját classloader nem tölti be, az import nyomán megtalált *service* classloader ad nekünk egy `FactoryUtilt`. A ```new Account()```-ot viszont egyértelműen a *service* classloadere hozza létre, hiszen a FactoryUtil-t -- akiben ez a a példányosítás szerepelt -- is ő hozta létre.

### 2. példa

Miért fontos ez? Próbáljunk elképzelni egy olyan felállást, amikor a service szeretne plugint betölteni futás közben. Például:

A *service* tartalma:

 * ```hu.dpc.demo.osgi.util.FactoryUtil``` class
     * ```getPluginRegistration``` metódus, ami classpathon keres plugin leírót:
         * pl: ```getClass().getResource("/META-INF/services/" + pluginName);```
 * Megfelelő bejegyzések a ```META-INF/MANIFEST.MF```-ben
     * ```Export-Package: hu.dpc.demo.osgi.util```

A *client* tartalma:

* ```BundleActivator``` implementáció, ami lekér egy ```FactoryUtil```-t és meghívja a ```getPluginRegistration("myPlugin")``` metódust.
* Megfelelő bejegyzések a ```META-INF/MANIFEST.MF```-ben
    * ```Import-Package: hu.dpc.demo.osgi.util```
* Plugin regisztrációs leíró
    * ```META-INF/services/myPlugin```

Mi fog történni? A FactoryUtil-t a *service* bundle töltötte be. A *client* bundle látja az exportált dolgokat a *service*-ből, de a *service* semmit se tud a *client*ről. Tehát a plugin leírót se fogja megtalálni és null-al fog visszatérni a `getPluginRegistration("myPlugin")` hívás.

Természetesen még rengeteg lehetőségünk van. Egyrészt vannak további OSGi trükkök *Dynamic import*, *Fragment Bundle*, másrészt level3-on már belép az, amikor kézzel állítgatjuk különböző framework-ök classloadereit. (Általában a jól megtervezett frameworkök azt vagy engedik vagy kifejezetten igénylik...). De ezek részletes kifejtése sajnos nem fér ide a margóra. Frameworkök tervezéséhez viszont [ezt](http://njbartlett.name/2010/08/30/osgi-readiness-loading-classes.html) a remek bejegyzést ajánljuk.
