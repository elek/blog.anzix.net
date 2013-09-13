---
title: Java Mission Control
tag:
   - mission control
   - monitor
   - jconsole
   - jvm
date: 2013-09-13 21:45
---

Megjelent a JDK 7u40 ami az új [versioning scheme][versioning] szerint egy _Limited Update_. Azaz nem csak biztonsági frissítés, hanem kerülhet bele új elem is, de csak visszafogottan, hisz ez nem új JDK verzió, az majd a 8-as lesz.

Egy új dolog, ami bekerült, az a [Java Mission Control][jmcrelease], ami ha jól értem, akkor már benne volt a JRockitben is, de azon hosszú távú terv szerint miszerint a JRockit és a ("hagyományos") Hotspot JVM konvergál egymás felé, most itt is megjelent.

A jogállás nem egészen tiszta, mert a leírás szerint:

> Java Mission Control (JMC) is a commercial feature available for Java users with a Commercial License.

Ugyanakkor:

> The JDK 7 update 40 release includes the first release of Java Mission Control (JMC) that is bundled with the Hotspot JVM.

Talán azt jelenetheti, hogy benne van, de csak kereskedelmi licenszel szabadna használnom (?).

Maga a `jmc` egy Eclipse RPC alapú alkalmazás (nahát, nahát, a VisualVM még Netbeans platformon futott), ami a JConsole és a VisualVM-hez hasonlóan hozzá tud csatlakozni futú JVM-hez, és mindenféle információt adni.

Első induláskor a csatlakozott JVM-ekhez két eszköz érhető el. Van egy _MBean server_, ami az első kattintgatások alapján kb. azt tudja, amit a JConsole és s VisualVM is. Elérhetőek a JMX beanek, és egy rendkívül eladható, bár nem túl letisztult grafikus felület is, amin láthatóan JMX-en keresztül beszerzett információkat lehet csodálni:

![JMC MBean Server](/images/jmc.png)

Az izgalmasabb rész a Flight Recorder. Ez alapvetően eseményeket (event) tud rögzíteni, folyamatosan, vagy egy adott időintervallumon keresztül. Esemény minden lehet. Garbage collector működésének különböző fázisai, metódus hívások, CPU-, memória-, HEAP-információk, szál létrehozása, leállítása, stb. Sőt elvileg Java API-n keresztül elvileg saját eseményeket is definiálhatunk az alkalmazásunkba (erre a dokumentációt még nem találtam meg, csak az utalást rá, de van WebLogic kiegészítő csomag, ami szintén arra utal, hogy ez valahogy megoldható.)

A rögzített eseményeket természetesen mindenfajta színes és szagos diagrammon megnézhetjük. Egy idősávon láthatóak a különböző események, és tetszőlegesen ránagyíthatunk bármelyik időszeletre, és szűrhetünk az eseményekre. A nagy ráció az az eszközben, hogy egy felületen láthatjuk minden paraméterét egy futó alkalmazásnak. Például egy idősorból könnyen kiderülhet, hogy ha egy bizonyos kivétel pont akkor történt, amikor egy nagyobb GC esemény, vagy valami komolyabb IO művelet. 

A hangulatát lefestendő néhány képernyőkép:

![JMC2](/images/jmc2.png)

(Figyeljük meg a fenti idősoron a CPU eseményeket, ott lehet szűrni.)

![JMC3](/images/jmc3.png)

(A táblázatban az összes rögzített esemény)

Ahhoz hogy a Flight Recorder egy JVM-re elérhető legyen, a ```-XX:+UnlockCommercialFeatures -XX:+FlightRecorder``` paraméterekkel kell elindítani. Továbbá el lehet indítani a Flight Record rögzítését parancs sorból is JVM paraméterekkel (pl. ```-XX:FlightRecorderOptions=defaultrecording=true,disk=true,maxchunksize=10M```). Ilyenkor a rögzízés folyamatos, és az adatokat a Mission Controlon keresztül bármikor le lehet kérdezni (akár adott időintervallumra szűrve). A performancia természetesen függ attól, hogy milyen eseményeket figyelünk, de az alapértelmezett beállítások a GUI szerint max 1-2 % lassulást eredményezhetnek.

Összegezve az első benyomásokat: nem maga az eszköz, ami lázba hoz, hanem inkább a Flight Recorder. (Bár sajnos úgy tűnik, csak kereskedelmi licence-szel lesz elérhetető...). Találkoztam már olyan rendszerrel, ahol minden egyes GC eseményt mentettek adatbázisba, és sokszor nagyon jól jött ez az információ (tipikus lekérdezés: mi változott a GC időtartamokkal egy relese után az előttihez képest...). Mivel eddig erre nem volt jó eszköz, ott azt csinálták, hogy bekapcsolták a GC logolást egy file-ba, és egy saját fejlesztésű kis agent mentette el az információt egy NoSQL adatbázisba minden gépről. Most erre gyári megoldás lesz, és nem csak a GC adatok, hanem gyakorlatilag minden esemény elmenthető, ami érdekel minket (Exceptionök, CPU, Memória, stb.), amik között nagyon jól lehet majd korelációkat keresni. 

És persze mindez csak az, amit az első próba alapján láttam, és még van is néhány homályos rész, aminek utána kéne néznem:

- Hogyan kell saját eseményeket definiálni?
- Lehet-e a Mission Control helyett saját eszközökkel kinyerni az esemény információkat a Flight Recorder logból (és pl. tárolni az összes JVM adatait egy központi adatbázisban)?
- pontosan mit is jelenet a licenszelése?

[versioning]: http://www.oracle.com/technetwork/java/javase/overview/jdk-version-number-scheme-1918258.html
[jmcrelease]: http://www.oracle.com/technetwork/java/javase/2col/jmc-relnotes-2004763.html