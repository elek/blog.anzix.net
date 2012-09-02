---
layout: post
title: ! 'DAY 3: TheServerSide Java Symposium Barcelona 2007'
tags:
- TSS Symp
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2007/06/tssjs-eu-day-three.html
  _edit_last: '2'
---
A harmadik napra elfogyott a lendulet, nagyon gyengere sikerult a felhozatal:
<strong>Meeraj Kunnumpurath, Jim Marion, Jeremez Boynes: SCA/Fabric 3 - Not the Same Olda Architecture</strong> Yet another Apache JCA implementation (lasd meg Tuscany). Harman tartjak. Az elejen bo lere eresztett bevezeto, de igen, tudjuk miert es mire jo az integracio. Aztan egy nem tul latvanyos demo. Valami olyasmit lattunk, hogy a Fabric3 clusterszeru kepesegekkel bir, de hogy mi az SCA tetje, es pl. egy PHP componenttel hogy tarsalgunk, az nem derult ki.
<strong>Ted Goddard: Ajax Security Smackdown </strong>Itt elkovettem azt a hibat, hogy beultem egy olyan ficko eloadasara, akinek a cege szponzor volt. Ti sohase tegyetek. Akinek van penze, az lehet, hogy okos embereket foglalkoztat, de nem feltetlenul jo eloadokat.
Jevgeni Kabanov: Step-by-Step Legacy Migration With Arena Ez a nap fenypontja, es talan a 3 nape is. Nagyon jo volt. Pont megfeleloen tomor bevezeto, a trivialis peldakat nem mutatja meg eloben, csak pont jo output kivagasokkal, de demo is van. Nagyon jo eloadas fejlesztoi szemmel. Jol felvazolta mi a tetje a dolognak, es hogy a kodban kb. milyen buktatok voltak, es kb. milyen megoldasrol van szo, hogy mukodik.

Maga a temara amugy csak jobb hijjan ultem be, de vann benne ertelem amugy is. Egy komponens alapu (naluk Widget) webframeworkot csinaltak (Aranea). Ez eddig meg mindenkivel megesik, nem nagyon izgalmas. De kitalaltak, hogy legacy alkalmazasokat ugy migralnak, hogy csinaltak olyan specko Widget komponenset, amibe pl. egy egesz Struts-os alkalmazast be lehet tenni. A regi alkalmazast reszekre bontottak, es a reszeket egyenkent tudjak atmigralni JSF, GWT, vagy akarmire (mihez Widget ragaszto osztaly kesz van, de ki fog jonni sok). A regi reszek a frameworkon belul Widgetek, es az uj reszek is. Azt hiszem nem tudtam jol elmondani, de erdemes vele foglalkozni, mert nemcsak hogy okos, de eleg lightweight megoldasnak is tunt.
<strong>Kirk Pepperdine: Mesauring up Performance </strong>Nyilvan tele volt a konferencia menedzserrel, de en hegesztomunnkas vagyok. Ha fel oraig csak folyik a mese, hogy igen merni kell, es nem tok mas rendszeren, mert akkor lehet, hogy nem jon ki a hiba, szoval ilyet hallgatva egy kicsit elszall az ihlet.
<strong>Thomas Watson: Server-side Equinox/OSGi and You</strong> Neztem az orat 1+1/4 oras eloadas, es 3/4 ora elteltevel meg csak Equinox-rol es Eclipsrol volt szo. Meg kicsit OSGi-rol, amit mar hallottunk tegnap. Szoval jo tema, lassu eloadas. Amugy arrol van szo, hogy vegre Servlet kontenerbe is behegeszttenek OSGi kontenereket. Kb 1,5 eve, amikor ez iranyba nezegettem valakik meg azt irtak, hogy ne kelljen nekem WAR fileban OSGI kontener, inkabb deplozoljak webszerver OSGi komponenst a standalone OSGi kontenerbe. Na ez azert eleg sovany, kb azt jelenti, hogy hasznalj Jettyt es kesz. Most vegre lathato, hogy megoldottak a dolgot, ami figyelemre melto. De ezt szebben is lehett volna mondani.
