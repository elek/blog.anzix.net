---
layout: post
title: ! 'Szczepan Faber: Mockito in Action'
tags:
- Devoxx
- easymock
- jmock
- mock
- mockito
status: publish
type: post
published: true
meta:
  _edit_last: '2'
---
Mock frameworkről van szó, volt már ilyen, a fóliák is felsoroltak legalább 20 konkurenciát. Ami jobban meglepett, hogy a hallgatóság fele használ valamilyen mock frameworkot (én nem voltam köztük), ezért nem is hüvelyeztük sokáig, hogy mire jó, hanem neki estünk a kódnak: az előadás gerince egy demó volt, ahol <a href="http://monkeyisland.pl">Szczepan</a> test driven megírt két osztályt és a hozzávaló teszteket (illetve nyilván időben fordítva). Teszt osztályból rögtön hármat is írt, az egyiket <a href="http://code.google.com/p/mockito/">Mockito</a>-val, a másikat EasyMock-kal, a harmadikat jMock-kal.

Zongorzázni azért nem lehetett a különbséget, de az ő megoldása kicsit szebb volt (API szinten), és a hibaüzeneteket bizonyos esetekben szebben írta ki (a stack trace tényleg a hibára mutatott).

Izgalmas előadás volt, főleg, mert nem vagyok napi mock használó (leginkább EJB3 POJÓkat tesztelek a valós életben, és ehhez nem feltételenül kellett eddig), és kicsit jobban beleláttam a mock frameworkok nyújtotta élménybe. Valamelyik kísérleti projektben el kéne kezdeni használni.

Amúgy az előadás konzekvenciának ezt mondta: <em>Use the tool that works for you. </em>Nem lesz nehéz követni a tanácsot.
