---
layout: post
title: Maven kezdet
tags: 
- maven
status: publish
type: post
published: true
---
Valószínű már mindenki Maven2-n nyomja (az egészen ortodox ant hívőket
kivéve), meg kellett hát néznem nekem is. Egy kis projektem migrálásával
próbáltam ki.

Útmutatóm a nagyon korrekt (regisztráció után ingyenes letölthető) [Better
Builds with Maven](http://www.mergere.com/m2book_download.jsp) könyv volt. (Az
első fejezeteit olvastam el eddig, az alapokat nagyon korrektül leírja).

A vélemények:

1. a plugin rendszer, a közös repo, amiben a függőségeket tárolja az első használat után is igen meggyőző megoldás.
2. az alap pluginek a leírás alapján nagyon könnyen beizzíthatóak voltak, ment minden pöccre.
3. illetve néha kiírta, hogy valamilyen függőséget nem talál, de ha mégegyszer elindítottam, akkor simán letöltötte. Utána meg már ment, úgy hogy nem volt kedvem utánamenni mit nem állítottam be.
4. Azért az alap pluginek között is van néhány rejtély. Pl. az scm (amiről a könyv nem beszélt részletesen csak a release fejezet révén egy kicsit és ott még nem tartok). A generált honlapja pl. tartogat néhány 404-et, és a jirában 2004 óta terveztgezik, hogy [Create user guide/Guide for the impatient programmer](http://jira.codehaus.org/secure/IssueNavigator.jspa?reset=true&mode=hide&pid=10527&sorter/order=DESC&sorter/field=priority&resolution=-1&component=12070)
5. Azért én türelmes voltam és kiderült, hogy viszonylag kis munkával, ha nincsenek is a goal-ok kiírva a plugin lapján a forráskódból kideríthető a működés.
6. A pluginek doksija általában néhány példa, ami sokszor elég, néha nem. Nagyon sokat lehet tanulni azonban a forrásukból is, mert általában a pom.xml (és pl. a site source) is fent van a verzókövetőben és rögtön lehet látni, hogy hogy csinálták meg ők valamit.
7. Persze az alap pluginek működése közül sok nem azt nyújtja pontosan amit én szereték (pl. changes), de azt látom, hogy nagy királyság az is, ha ilyenkor írok egy plugint és egy életre meg lesz ami kell.
8. Azért nagy és bonyolult projekteknél a site generátor nem tudom mennyire működne, de szinte megjött a kedvem a kis lokális projekteket is egy hejde kis maven site-tal dokumentálni.
9. Alig várom, hogy az [sf](http://maven-plugins.sourceforge.net/maven-sourceforge-plugin/) plugint is kipróbáljam, mert ha az is megy, akkor tényleg befizetek rá. 

