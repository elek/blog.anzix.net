---
layout: post
title: Maven, Release, Hudson
tags:
- hudson
- maven
- mercurial
- release
status: publish
type: post
published: true
meta:
  _edit_last: '2'
---
Az ideális releaselés minimum követelményeit így képzelem:

1. A release automatikus (egy gombnyomásra történik) és a CI szerver készíti el
2. hiba esetén újra lehet indítani
3. nem befolyásolja közben a fejlesztést (nincs commit csönd)

Alapvetően sose voltam nagy barátja a Maven release pluginnek, kicsit merevnek
tartottam, de hosszas kísérletezés után legtöbb esetben még mindig ez tűnt a
legkevésbé problémás megoldásnak. Kicsit kell figyelni a pom-ok felépítésére,
de az még jó is, ha tisztább pomokra kényszerít. (Egyébként a forrása is
viszonylag kellemes csalódás volt, egész szép, leszámítva a modellos
fejlövéstől, amit az előzőekben már felhánytorgattam). Ha a maven release
plugin már adott mint eszköz, akkor még mindig van néhány nyitott kérdés:

# **1.** **trunkon vagy branchen?**

A kedvenc koncepcióm a tárgyban [itt](http://nvie.com/git-model) olvasható.
(Git-ről beszél, de Mercuriallal ugyanúgy használható). Ez egyértelműen azt
javasolja, hogy külön ágon releaseljünk. Ez egy kicsit megbonyolíthatja a
release folyamatot, de amellett előnyei is vannak:

1. a hármas pontot alapból kielégíti. A release branchre rámergáljuk a trunkról a stabil változatot, és release közben már senki se ronthatja azt el.

2. lehetőség van arra, hogy ne csak a trunk ágat, hanem más ágakat is releaseljük. Ha egyszer a release ágon működő release-gép tökéletes, akkor csak azt kell elérni, hogy bárhonnan a release ágra mergeljünk bármilyen kódot (akár egyoldalú merge-vel, ahol minden fájlból a külső branchen lévő változatot tekintjük alapnak).

A 2. pont persze már eltér a fenti linken található ábrától, amely ábra
külödben sem is használható tisztán maven release pluginnel, mivel pl. a
tagelést a plugin egyértelműen a release branchen végzi. A 2-es pont szerint a
release branchünk igazából csak egy staging hely, ahová felrakhatjuk a kódot,
amíg a release sikerül, és a mikor ténylegesen kész lesz, akkor vissza
mergelhetjük.

# **2. külön release job a hudsonban vagy nem?**

Ha használjuk a trunk mellett a release branchet is, akkor rögtön jön a
probléma, hogy a hudsonon alapból a trunk branchet akarjuk buildelni, de
releasekor a release branchet. Ezt a hudson egy kicsit nehézkesen kezeli.
Léteznek workaroundok: pl. m2 extra stepst-ben hg parancsok, vagy
paraméterezett build, ahol a paraméter alapján checkoutol, de a gyakorlatban
nekem egyik se bizonyult stabil megoldásnak (az átláthatóságról nem is
beszélve). Az egyszerű megoldás, amit épp követünk, új jobot hozunk létre a
Hudsonon. Klónozzuk az eredetit, és az új job az előzőekkel megegyezően
működik (változás esetén sajnos mindig frissíteni kell a build paramétereket),
de a release branchet forgatja (célszerűen private local maven repository-t
használva!!). A külön job-os megoldás arra is jó, hogy a release branchre való
merge után még egy utolsó ellenőrzésként egy hagyományos buildet is kérhetünk
az ágra, mielőtt a release build-et kérjük a hudsonból

# **3. M2 release plugin vagy általános release plugin?**

A Hudsonban két release plugin is van. Egy általános és egy kifejezett Maven-
re szabott. Mindkettő azt nyújtja, hogy megjelenik egy új gomb is a job
oldalán: a _build now_ mellet lesz egy _start release build_ opció is. Az
általános release pluginban pre-steps és post-steps lehetőségek vannak. A
release build gyakorlatilag egy rendes build, csak a post f'ázisban
tetszőleges múveleteket (pl. _release:prepare_ _release:perform_) is
elvégezhetünk. Sajnos a Hudson korlátai miatt a post lépések mindenképpen
lefutnak még akkor is, ha a rendes build elhalt, ami nem túl elegáns. Az
általános release pluginnak viszont kellemes szolgáltatása, hogy a release
buildet tartóssá teszi (keep this build forever) és meg is tegeli. Így a job
lefutásai között egyértelműen látszik, hogy melyik volt a release. Egyelőre én
mégis a Hudson M2 release plugint használom. Ez kifejezetten Maven releasere
lett kitalálva, tehát korlátozottabb tudású, azt viszont jól csinálja, és nem
kell trükközi post stepekbe rejtett release logikával. A sikeres release
buildet aztán kézzel tartosítom (_keep build forever_).

# **4. staging scm vagy éles?**

Az egyik problémája a release pluginnek, hogy elosztott SCM esetén nem csak
commitol, hanem pushol is. Ha a release mégsem sikerül, akkor is
teleszemetelte a repónkat mindenféle saját committal. Erre ad egyfajta
[megoldást](http://weblogs.java.net/blog/fabriziogiudici/archive/2009/10/29
/fixing-two-problems-maven-mercurial-hudson) Fabrizio Guiduci. Ennek lényege,
hogy a release alatt egy profile/property trükkel az aktuális scm bejegyzést
egy temporáls repositoryra állítja át, így oda fog pusholni a release plugin.
Amennyiben a release sikeres volt, akkor a staging repositoryból lehet
pusholni az élesbe. Volt, ahol használtam ezt a trükköt, de ma már úgy látom,
hogy nincs nagy jelentősége. Egyrészt mivel külön release branchen releaselek,
ott nem zavarnak a felesleges commitok annyira. Legrosszabb esetben hg
backout-olok (remek parancs, egy adott commit diff-jét invertálja és
commitolja újra be.) Git-be meg ugye alapból lehet changeseteket törölni.
Másrészt mivel a Hudson-on a release branchre rá van állítva a release job,
amit release előt még sima buildel ellenőrzök, az esetek nagy részében a
releasenek már hiba nélkül kell lemennie. (Általában hiba ebben a fázisban már
csak akkor merült fel, ha pont a pusholás volt sikertelen)

# **5. staging repo vagy éles?**

Az előbbi linken nem csak a mercurial repositoryból csinált stage-et az író,
hanem a cél Maven repositoryból is. Kezdetben csak egy temporális helyre
deployolt, és ha minden jól ment, akkor onnan egy maven pluginnel tolta fel a
végleges helyére a buildelt artifactokat. (Egy kicsit kidolgozottabb staging
koncepció is [létezik](http://www.sonatype.com/people/2010/07/multi-level-
staging-and-build-promotion-with-nexus-pro-1-7/), amit a Nexus Pro támogat.)
Eddig az volt a tapasztalatom, hogy ilyenek nélkül elég jó tudok élni. A
deploy a release:perform utolsó lépése, tehát ha felmentek az artifactok,
akkor a release már jó volt, ha nem ment fel, akkor még gyűrni kell. De olyan
eset eddig nem volt, hogy felment, de le akartom volna szedni.

# Egyéb tapasztalatok

1. A maven release plugin nem szereti, ha elosztott verzió kezelőt használunk
és nem a gyökérben van a pom.xml. A _release:perform_ lépésben ugyanis a
target/checout könyvtárba az egész repót klónozza, de arra nem lehet rávenni,
hogy a repó egy alkönyvtárát buildelje csak meg. Botrány. 

2. A _release:prepare_ lépés során történik egy ellenőrzés. A checkoutolt source-on
a maven futtat egy **clean verify** kombót. Ez kellemetlen meglepetésekkel
szolgálhat, ha az alprojektek kézileg össze vannak kötögetve. (Pl.
dependencies:unpack). Ekkor a nagyerejű _-D__preparationGoals="clean install"
_segíthet. A többi meg már megy magától.

