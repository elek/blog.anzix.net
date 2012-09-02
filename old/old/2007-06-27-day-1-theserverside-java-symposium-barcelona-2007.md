---
layout: post
title: ! 'DAY 1: TheServerSide Java Symposium Barcelona 2007'
tags:
- TSS Symp
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2007/06/tssjs-eu-day-one.html
  _edit_last: '2'
---
Akkor nezzuk:
<strong>Martin Fowler, Neal Ford: Language-oriented Programming and Language Workbanches</strong> Reggeli Keynote eloadas, azaz teljese tomeg elott prezentalnak, viszonylag altalanos dolgokat. Ennek ellenere meglepoen jo. Azon elmelkednek, hogy a programozasi nyelvek mennyire kovetik az eggyes problemakorok DSL (Domain Specific Language) leirasat. Pelda a Starbucks kavceg eloirasa volt, ahogy megmondjak hogy hogy csinalj lattet (szep angol mondat) es ennek a Java-s atfogalmazas volt, amiben persze egy csomo felesleges dolog is volt (a szintaktika miatt sok mindent ismetelni kellett, a lenyeg tekinteteben ez csak noise) Aztan beszeltek internal DSL es external nyelvekrol, az utobbi pl. az XML, mert kozelebb van a termeszetes nyelvhez, de igazabol azt majd leforditja maganak a Java.

A Ruby es mas dinamikus nyelvek eloretoreset is ha jol ertettem azzal magyaraztak, hogy a nyelv tomorebb, es termeszetesebb, az uzletemberek szamara is jol olvashat. Ami lehet, de szerintem a managereknek nem hiszem, hogy az lenne a bajuk, hogy a Java code-ot olvasni akarjak, es nem tudjak. (Lasd: specko Vision fejezet definicio: Vision az, amit a liftben el tudsz mondani a managernek.)

<strong>Stephen Colebourne: Java Closures</strong>: Kevesbe profetikus magavalragado stilus, de nagyon okosan osszeszedett. El mondja miert kell nekunk (lasd elozo temat, hogy egyszerubb kodot kapjunk, ami csak a lenyeget mondja meg). Es elemzi a closures proposalokat. Az egyiket o irta felig. Ha lessz idom leirom reszletesen a jhacksen, addig csak, hogy tudjatok kire kell szavazni:
CICE - nagyon primitiv syntax sugar proposal, az inner classokat egyszerusiti, sok mindent nem old meg. BGGA - nagy nevek adtak be (Az egyik G belole Gosling), a tobbi programnyelv alapjan alkottak meg. Ezert aztan minden franko dolgot tud, a szintakszisanak viszont semmi koze a Javahoz: rettentes (pl. az hordoz jelentest, hogy kirakod-e az utolso sorban a pontosvesszot a sor vegere). FCM - kisemberek irtak (az egyik az eloado), es engem meggyozott. Tudja azt amit a nagyoke, csak sokkal emberibb szintakszisa van, es sokkal magatol ertetodobb. A Sun allitolag egyelore kivar, megvarja a developerek mit mondanak. Szoval amig nincsen sajat tapasztalatom, addig en az FCM-re szavzok.

<strong>Erik Doernenburg: Taking Test-driven Development to the Next Level</strong> Erre eleg kivancsi voltam, hogy valami hiper test frameworkot mutat be, de nem. Kiderult ugyan is, hogy a prev. level a unit test mock objectek nelkul, a "next-level" meg mock objectumokkal (esetleg dinamikus mock keret rendszerekkel). Kicsit csalodtam. Lattunk sok kod peldat, es bebizonyosodott, hogy a decoupling jo dolog.

Tanulsag: ha nem hasznaltok mocks keretrendszert (pl. jMocks), akkor nezzetek utana mit tudnank.

<strong>Doug Clarke: Going to Extreme</strong>: kis markenting, az ebed tamogatoja, az Oracle reklamozza nekunk a termekeit. A kola melle elment, neha meg szep Eclipse+JPA demokat is lattunk.

<strong>SOA Industry Leaders Technology Panel</strong>. Ez egy kerekasztal beszelgetes, a nevekre nem emlekszem, es valtoztak is, ugy hogy nem is tudom kiirni. Amugy semmi ujjat nem tudtunk meg. JBI-rol azt mondtak, hogy persze egy megoldas Java-ban, adott esetben szukseg lehet ra, de mivel konkret esetekben kellhet, nem lesz o a fokolompos, csak egy a valasztekbol. A IONA-s ficko azt mondta, hogy az SCA es a JBI szerinte nem konkurensek, mert eltero szinteken vannak.

<strong>Ola Bini: JRuby - Ruby on the JVM</strong>. Nagyon magaval ragado eloadas, szamomora   a nap egyik legjobbja. Bar eleg alapozo: Ruby alapok, miert jo a Java implementacio, a hibakra is jol felhivta a figyelmet, majd hogy milyen megoldasokat gondol ra. Nagyon gordulekeny stilus. (A ficko fanatikussagat jellemzi, hogy amikor megkerdeztek tole, hogy egy ilyen dinamikus nyelvet mennyire tamgatnak az IDE-k annyira mint a Java-t, o azt mondta, hogy hat, o Java-hoz is emacs-ot hasznal :) Na jo aztan komolyan is valaszolt (BTW az ot masik Core deeloper meg NetBeans-t)).

Nem vagyok meggyozve, hogy ez az udvozito nyelv, bar szep tomor, de en jobban szeretem a tipusasbb nyelveket. Azert mindesetre annzira meggyozo volt, hogy valamennyire meg kell neznem. Izgalmas lehet Java-ban nyelv interpretert irni.

<strong>Heinz Kabutz: Productive Coder</strong>: Onnan kezdtuk, hogy hasznaljuk billentyuzetet eger helyett, es aztan mindenfele code metrics fogalomfele huzott att. Fent tudta tartani az erdeklodest a kesei oran is. Ugyes pelda volt, hogy a semmit mondo getter
javadoc-ra a Java SDK-bol hozott peldat, es megmutatta, hogy mennyire javult a helyzet a verziokban, es neha milyen buta komment van a Java forrasaban is (az idok soran sokat javult). Szoval nem volt rossz, csak valahogy az hianyzott, hogy miert nem emlitette meg a PMD-t vagyz a FindBugs-ot. Egy csomo dolog amit mondott tok igaz, de nekem az IDE-be agyazott PMD-m mar akkor ki irja, hogy az hulyeseg, amikor meg le se irtam.

ui1: amugy tobb embrre szamitottam. kb akkora az egesz, mint a magyarorszagi webkonf.

ui2: Csokoltatom a spanyolokat a billentyuzetert, meg a Guglit, aki feltetelezi, hogy ha eddig az osszes bejegyzest angol vagy magyar feluleten irom, csak azert mert az IE nyelve spanyol, azert megtanultam spanyolul.
