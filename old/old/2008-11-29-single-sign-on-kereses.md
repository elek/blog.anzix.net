---
layout: post
title: Single Sign On keresés
tags:
- cas
- josso
- opensso
- sso
status: publish
type: post
published: true
meta:
  _edit_last: '2'
---
Kéne egy SSO megoldás, ami:

1. Cross-domain SSO-t is tud, azaz ha van két teljesen különböző domainem, és az egyik alatt belépek, a másikon is automatikusan be legyek.

2. Lehessen kapcsolni hozzá teljesen különböző alkalmazásokat is, pl. Apache httpd alapú SVN szervert. (Erre elvileg az is megoldás, hogy ha LDAP-ba tárolja a felhasználó adatokat az SSO).

3. Legyen valami felület, ahol a felhasználó tud: regisztrálni (default jogokat kap), jelszót változtatni, elfelejtett jelszóhoz emlékeztetőt kérni, stb.

Ahol tartok:

1. <a href="https://opensso.dev.java.net/">OpenSSO</a>

Glassfish Prelude alá nem ment fel*.

Glassfish V2 alá felment, viszont nagyon kevés <em>jó</em> tutorialt találok hozzá. Lehet hogy az a baj, hogy nagy a zaj a kereséseimre: teleptésí leírás sok van, de, hogy a fenti célokat hogy tudom elérni, az egyelőre rejtély. Valószínű végig kell nyálazni a Sun-os Access Manager doksikat. Illetve a opensso wiki-ben belinkelt cikkeken kéne végig menni.

Mindehhez tartozik, hogy az egész cucc 270Mb (ebből a deployolandó war 80Mb), tehát nem egy pehelysúlyú megoldás.

Amit eddig láttam belőle: 1-2-t tudni fogja, de a 3-at még nem láttam benne.

2. <a href="http://www.josso.org/">Josso</a>

Csak a weboldalát nézegettem eddig, de úgy tűnik ehhez 3-as web felületet nekem kell csinálni. A dokumentáció szerves része, hogy végeláthatatlan config fájl példákat idéznek. Le kéne tölteni, és megnézni közelebről.

3. <a href="http://www.ja-sig.org/products/cas/">CAS</a>

Még annyit sem foglalkoztam vele, mint a Josso-val. Azzal kéne kezdeni, hogy 1-et tudja-e.

* Két gépen (Hardy / Intrepid) is próbáltam, az egyiken Glassfish V2 alá gond nélküld felment. Amikor nem megy, akkor a jó jelszóval belépés után ugyanaz a belépőfelület jelenik meg <strong>mindenféle hibaüzenet nélkül</strong> (a logban se találtam semmit). Ha rossz jelszóval próbálkozom, akkor kiírja az autentikációs hibát.
