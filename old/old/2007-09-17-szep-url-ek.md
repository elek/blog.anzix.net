---
layout: post
title: Szép URL-ek
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2007/09/szp-url-ek.html
---
Szeretik a keresők, szeretik az emberek, esztétikus jó ilatú, stb. Ilyet
szeretnék mindenhová. A vonzódásom története valami ilyesmi:

  
Hajdan, még Post-Nukés gyerekkoromban volt az
index.php?mod=foo&bar=func&param=1&.... A Front Controller megkereste a foo
modult, annak a saját kis frontcontrollere megvalósította a func funkciót, a
paramétereket meg beparzolta a funkció.

  
Aztán jöttek az ügyes apache rewriteok: index.php/foo/bar?par=... csak kicsit
szebb, de nem az igazi.

  
Aztán megismertem, hogy hogyan csinálja ezt a Drupal. A Drupal-ba alapból csak
szép URL-ek vannak. Van egy nagy fa szerkezet, és abba egy path egy modul
funkció. Ezt pedig szép szorgalmasan fel kel meppelgetni.

  
Pl. (hasból) a admin/user/rights => admin_user_rights()-hoz lehet rendelni.

  
A nagy bravúr benne, hogy ha nem talál a megadott path-hoz hozzárendelve
függvényt, akkor elkezdi leszedegetni a részeket / jelenként jobbról balra.
Pl. a node/edit/22-höz ha nincs rendelve semmi függvény, akkor a node/edit-hez
keres (amihez valószínű lesz), és a 22-t átadja paraméternek.

  
Ebből következik, hogy a paraméterek a drupálban sokszor nem kulcs érték
párok, hanem pozíciók. Az ismert meppelés után első, második, harmadik... stb.
Szerintem ez mondjuk sokkal szebb és logikusabb mint az előbbi.

  
Wicket-ben ez úgy néz ki, hogy alapból az oldalak amiket létrehozunk nem
kapnak szép URL-t (sőt rosszabb esetben a csúnya url-n se lehet kívülről
elérni őket). Hasonlóan a Drupalhoz kézzel a mappinget beállítani
(WebApplication.mountShortBookmarkablePage()). A baj csak azzal van, hogy nem
a Drupal féle pozíció=> paraméter leképezést használja, hanem a kulcs érték
párosat, ami nekem kevésbé tetszik. Igaz ezt hajlandó akár az
oldal/param1/value1/param2/value2 alakban is használni (oldal/value1/value2
helyett, amit én szeretnék).

  
Megoldás: lesszármaztatni a BookmarkablePageRequestTargetUrlCodingStrategy-t
és újra implementálni a decodeParameters-t és a appendParameters-t (ezt a
szűlőben látott mint alapján nem nagy flikk-flakk). Ezután a mappelést a
WebApplication osztályból a

  
_mount(new AnzixBookmarkablePageRequestTargetUrlCodingStrategy(path,
bookmarkablePageClass, null)); _

  
paranccsal tehetjük meg. Persze még lehet csinosíthatni, hogy a pozícióhoz
rendelt paraméterek lekéréséhez frankó gettereket írunk valami leszármaztotott
helyre, de ez innentől újgyakorlat.

  
Marad viszonta kérdés: Hogyan csináljam meg ugyanezt JSF-ben?

