---
layout: post
title: Keep working
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2006/10/keep-working.html
---
Ősz, levelek, netbeans (stabil), benne kísérletek. Ez van mostanában.

# jBluez

A [BlueZ](http://jbluez.sourceforge.net/) a linux bluetooth stack-je, a JBluez
egy JNI-s adapter hozzá. A SourceForge múzeumból egy 2002-es release tölthető
le hozzá, ami megdöbbentő módon teljesen jól működik. Van hozzá 3 rövid
példaprogram, megy egy rövid txt, hogy hogyan leheljünk bele életet, és egy
mégrövidebb Troublehooting Guide, hogy hol fog elszálni. És tényleg elszállt
ott, és tényleg úgy lehetett kijavítani, és utána tényleg ment. El voltam
ájulva.

  
A szomorú az benne, hogy nem [JSR-82](http://www.jcp.org/en/jsr/detail?id=82)
kompatibilist, de olyat még nem sikerült találnom Linux alá.

  
(Közbe frissíŧettem az ubuntu-mat, és ebben már libbluetooth2-van, és a
bináris nem azzal ment. De egy szimbolikus linket megkockáztattam (új api a
régi néven is), és megette.

# OpenSSO

Gyűrés alatt. Vicces, mert mindenhol azt írják, hogy az OpenSSO based on Sun
Java Access Manager, de én sose tudom, hogy hogyan van a reláció. Pl. az
OpenSSO-ban csak maga a web-app van, meg most már az adapterek, de a plusz
konzolos alkalmazásokat még nem találtam meg. A dokumentációja is érdekes:
felrakták a Use Case leírásokat, meg az architektúra leírásokat, amit elég
izgalmas olvasni, (milyen egy Sun-os ilyen), de a használatról nem sok. Csak
admin és config guide-ok, semmi development útmutatás.

  
Van viszont elég sok cucc a docs.sun.com-on az Access Manager-hez, de az meg
ugye nem pont ez. Amire hivatkozik sokszor hiányzik, és lehet keresni, hogy
azok a utility-k itt hol vannak.

  
Tutorialt egyelőre nem találok, csak WebService titkolódzosat a NetBeans
tutorialok között, de én egyelőre csak sima SSO-t szeretnék egy web appban.
Illetve van
[egy](http://www.sun.com/bigadmin/features/articles/install_id_mgr.html) , de
még 8.1-es glassfish-hez, abból talán még lehet valamit.

  
A lényegből eddig ezt látom: egy deployolt webalkalmazás maga az Access
Manager. Lehet más szerverekre Agent-eket deployolni, amik szintén webappok.
Mivel ezek már a célalkalmazással egy domain-en futnak, ezért ha ezek
kommunikálnak az Access Manager-rel, és után egy cookie-ba nyomják az
eredményt, az elvileg a célalkalmazásból is hozzáférhető, és kezelhető.

  
Agent glassfishez csak 8.1-hezvan, de majdnem felment a 9-re, sőt valakinek
állítólag ment is. A 8.1-eshez viszont demo is van, annak kéne mennie.

  

