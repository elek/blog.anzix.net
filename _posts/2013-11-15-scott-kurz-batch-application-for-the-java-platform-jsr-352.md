---
layout: post
title: "Scott Kurz: Batch Application for the Java Platform (JSR-352)"
date: 2013-11-15 10:33
tags: 
   - devoxx
   - batch
   - batchprocessing
   - jsr352
type: dpc
---
A Java EE7 része már a JSR-352 batch processzing specifikáció is. Akik láttak már Spring Batch-et, azok valószínűleg tudják hová tenni. A többieknek: valami olyasmiről van szó, hogy van task olvasó, eredmény kiíró interface, és persze a futtató is. Be tudja olvasni a feladatokat, lefuttatni, akár párhuzamosan (de nem clusterbe), és szépen végig vannak gondolva a konfigurációk, hogy hány feldolgozás legyen egy tranzakció, mi legyen hiba esetén újrakezdhető, stb. Mindezt szép békebeli XML configurációval vezérelve.

Arról meggyőzött az előadás, hogy ez egy átgondolt API, de azért korántsem fogott el az az érzés, hogy most fel kell állnom, odamenni a pénztárhoz és bevásárolni minél több batch processing implementációt.

Annak, hogy valami JSR, szabványosított implementáció, több előnye is lehet. Egyrészt, mint például a JPA-nal, örülhetünk annak, hogy ha egy alkalmazásunk hordozható az implementációk között. Vagy az is lehet pozitívum, hogy mostantól egy batch processzing elérhető Java EE7 keretein belül is.

Én egyiket se éreztem olyan erős érvnek. Biztos csak a tapasztalatlanságom miatt, de valahogy az volt az érzésem, hogy azt, amit az API keretein belül meg tudnék csinálni, azt API nélkül is le tudnám kódolni 1-2 hét alatt, és akkor az pont úgy fog működni, ahogy én szeretném, és nem kell feltételes elágazásokat kódolni XML-ben.

<a href="http://www.flickr.com/photos/108542198@N03/10867322944/" title="Untitled by dpcconsultingltd, on Flickr"><img src="http://farm8.staticflickr.com/7362/10867322944_c3d5d42ef3.jpg" width="500" height="375" alt="Untitled"></a>

De azt is elfogadom, hogy ez csak az első lépés. Nyilván majd még fejlődik a JavaEE-vel tovább, és akkor a jövőben talán olyat se kell olvasni, hogy:

> Java-based JSL (Job Specification Language) annotations rejected by original Expert Group
