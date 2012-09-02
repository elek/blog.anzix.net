---
layout: post
title: DependencyFinder
tags:
- code
- dependency
- refactor
status: publish
type: post
published: true
meta:
  _edit_last: '2'
---
Elkövettük azt a hibát, hogy a hónapok során egyre inkább függő lett a GWT kódunk egy GUI könyvtártól. Szép menük, gombok vannak benne, amit nagyon sok helyen használunk, de most már úgy látjuk, hogy jó lenne kicserélni egy másik library-ra, de még inkább egy független wrapperre, ami mögött cserélgethetnénk a megvalósításokat.

De vajon mennyire függ a kódunk a library-tól. Kéne valami függőség felmérő, ami kiírja, hogy milyen nehéz lenne kitakarítani a kódunkból az idegen osztályokat. A JDepend-ben, és társai-ban sajnos nem találtam olyat, ami ilyet csinálni, csak mindenféle mérőszámokat kaptam.

Végül a <a href="http://depfind.sourceforge.net/">dependency finder</a> programra találtam rá. Csúnya oldal, csúnya GUI, kicsit átláthatatlan felület, de kis nyomogatás után ki írta ami kellett: egy adott szöveggel kezdődő csomagoktól milyen osztályaim függenek.

Kezdődhet a takarítás.
