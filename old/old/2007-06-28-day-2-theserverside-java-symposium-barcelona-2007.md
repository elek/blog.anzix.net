---
layout: post
title: ! 'DAY 2: TheServerSide Java Symposium Barcelona 2007'
tags:
- TSS Symp
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2007/06/tssjs-eu-day-2.html
  _edit_last: '2'
---
Mielott teljesen elaludnek a gep elott egy gyors vazlat:
<strong>Cliff Click: Java Performance Myths: What Lurks Deep Inside a JVM?</strong> Az eloado a tipikus szaki, aki mar nem is tud a temajarol beszelni, mert csak azon morog, hogy micsoda szart latott megint. Nem egy karizmatikus figura, es sok slide arrol megy, hogy milyen hibakat latott mar publikalt C vs. Java microbenchmarkok olvasasakor. Azert nehany vicces dolog is kiderult:

Hogy melyik a gyorsabb, az sokban fugg az adott alkalmazastol +-10%-os peldat fel sorolt (egyet asm vs. bytecode szintjen elemezgetett is, hogy miert), de o kiotlott olyan specialis problemat is, ahol a Java 50%-ban gyorsabb volt (persze arra ment ra, hogy kibabraljon a gcc-vel). Elmentdta, hogy a final kulcsszo hasznalat tok mindegy, es hogy ugy lehet jo eredmenyt elerni, ho "common code"-t irunk. Magyarul olyat, amire van optimalizalo a JIT-ben :). Elmagyarazta, hogy a GC-tol nem kell felni (object poolingnak alapbol nincs ertelme, csak koltseges inicializalaskor: pl db conn). Sokat valtozott a GC-is ugyanis es 100Mb-os heapnel elenyeszo. A problema az 1-4G-s heapeknel jon elo. Ott tenyleg lesz. Alapvetoen nem volt szerintem kifejezetten jo eloadas, de most hogy irom a jegyzeteket, talan ebbol az eloadasbol tudtam meg ezen a napon a legtobbet. (<a href="http://blogs.azulsystems.com/cliff/">Itt</a> a blogja is).
<strong>Gregor Hohpe: Programming without a Call Stack - Event Driven Architecture </strong>A google izgaga eloadoja. Szerintem kb. 10 percben ossze lehetett volna foglalni a lenyeget, egy jo abra volt, az mindent elmagyarazott. Az EDA-t egyebken kb arra a szinte raknam, ahol az ESB-s orchestration vagy coreography van. Ez is egy tervezesi minta, ahogy a service-eket osszekapcsoljuk, csak mas a filozofiank az osszekapcsolas mogott.
<strong>Jonas Boner: Pojo Scalability and Large Workloads with Open Terracotta</strong> Vagy az ebed hianyzott, vagy az eloadas volt kicsit lankadt, de nem tudtam mindig kovetni, hogy mit miert ervel. Mutatott sok kodot, meg szep abrakat. A vegen osztott Terracotta bemutato cikket, ami kb. hasonlo szemben elmondta a lenyeget mint o, gondolom ez a cikk letoltheto a Terracottarol. Ebbe bele nezve azert kb. tudom pozicionalizalni. Megosztott JVM gepek kozott. Van egy szerver es annak jelentik le a kliensek az allapotot. A flikk-flakk kivulrol csak annyi, hogy deklaralni kll XML-ben, hogy mely osztalyok allapotat ossza meg a JVM-ek kozott (egy csomot felesleges alapbol). Meg persze nyilvan kod szinten belul dol el a dolog.
Az ebed alatt a <strong>Sun</strong> beszel. Glassfish, WS stack, sok ujdonsag nincs. Elmegy az ido, a vegen mar csak epp megvillogtatni van ido ket SunSpot-ot.
<strong>Adrian Coyler: OSGi - A New Foundation for Enterprise Applications </strong>A tag a Spring-OSGi vezetoje, igazablo errol beszel. Az OSGi-rol csak bo lere eresztett bevezeto (de azt nem tudom meg, hogy az alapveto versioninig-classhiding-en kivul mit tud az OSGi, pedig remlik, hogy vannak ott meg security meg mindengele kiegeszitok). Azt lattuk, hogy mi lesz belole a Spring 2.1-en. Hat jo. Szep munka.
<strong>Eric Lu: Getting Started with JSR-208 - JBI</strong> Azt nyujtja, amit vallal: Getting started. Ezt a reszt kibekkeltem. Ami miatt erdekes volt szamomra, hogy a szokasos Hello World peldat (Amihez NetBeans tutorial van, OpenESB-hez), o a sajat ChainBuilder cuccaval mutatja be. Varazsol egy Service Componentet (nem csak drotoz!), aztan Eclipse alapu vizualis huzigaloval beizzitja. Szolid eloado, de a termekuket (szinten OS) meg kene nezni.
Es innentol BOF sessionok kovetkeznek:
<strong>Bruce Johnson: Making GWT Better</strong> Annak ellenere bementem ra, hogy az elozo GWT-s eloadason nem voltam, es nincs tul sok GWT tapasztalatom. Az eloado nagyon meggyozo, ugyesen keverte a beszelgetest es a prezentalast, sok kerdes elhangzott. Jozan ember, teljesen jol latja a termekuk elonyeit, es a kompromisszumokat, amiket emiatt bevallaltak.
<strong>Attila Szegedi: Using the Java 6 Scripting API </strong>Hazankfia (sajnos nem tudtam vele beszelni, mert utana lecsapott ra valami oltonyos kerdezoskodo) szolid eloadast tart a Scripting API-rol. (Egyszer najdnem en is tartottam, ezert emiatt en mar atneztem az amugy eleg szimpla API-t). O persze azert mas kaliber, a Java 6-ban alapbol szamitott JS motort a Rhino-t tartja karban. Egy kicsit kevesbe ereztem rutinosnak, es ez sajnos kicsit ratelepedett az eloadasra, de a kerdeseknel mar sokkal felszabadultabb volt, es mondott meg ezt-azt.
<strong>Alexandru Popescu: JCR in the Real World </strong>A JCR-rol rovid bemutatas (kozepesen izgalmas). Aztan beszelgetesbe megy at, elmond ezt-azt InfoQ.com-rol, ami mogott JCR-van. Egy finn fickoval aztan parttalan vitaba bonyolodik a tarsasag, az absztrakciorol. Eleg szimpatikus ficko, es jo megerzesei vannak, es erdekesen mondta el. Habar azt nem mondta el, amit en tudok, hogy miert ultimate eszkot a JCR, de most nincs helyem mar ide irni a margora (hi, F.).
A nap folyaman nehany magyarral beszeltem, ok alapvetoen csalodottak voltak az eloadas szinvonalait illetoen. En kellemesen csalodtam azert, egy kicsit rosszabbat vartam, ha jo erzekkel helyezkedett az ember, kibekkelte a nagy hulysegeket, es akadt ertekelheto is jocskan.
Holnap utso nap.
