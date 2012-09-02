---
layout: post
title: Csütörtök keynote
tags:
- Devoxx
- java7
- jigsaw
- modularitás
status: publish
type: post
published: true
meta: {}
---
**Joshua Bloch: Effective Java Reloaded**  
  
A nemrég megjelent Effective Java 2dn edition-ból mesélt el néhány fejezetet.
Én néhány fejezetet olvastam eddig a könyvből. Azok alapján azon kevés műszaki
könyvek közé tartozik, érdemesnek találok megvenni. Bár a fejezetek legalább
felében ismert dolgokról beszél, azokat ügyesen foglalja össze, és érdekesen
meséli el, és azért mindenhol előkerül egy-egy ügyes trükk.

  
Ilyen volt az előadás is: nagy része ismert, da az is izgalmasan előadva,
másik részében ügyes trükkök. 5-6 fejezez Generics, Enum és Lazy
initialization témakörben.

  
**[Mark Reinhold](http://blogs.sun.com/mr/): The Modular Java Platform**  
  
Eredetileg Java SE 7 Update lett volna az előadás alkalmazkodott a pár napja
bejelentett változásokhoz (JSR-277 helyett Jigsaw)

  
Felvezetés: Egy helló world akalmazás 77ms alatt indul el (vs. python 7s) és
332 osztályt tölt be.

  
Elmondta, amit már a blog-postban is olvastunk: két szintű modularitás: a JVM
is modulokból áll, és a java alkalmazás is. JSR 277 hold állapotú lett,
JSR-294 még él.

  
És még néhány jegyzet a fóliákról (olyan szép pontokba voltak, muszáj volt
néhányat leírnom)

  
Project Jigsaw:

  * simple
  * low level
  * interoperable with OSGi
  * no JSR (nem Java SE része lesz, hanem a Sun-os JDK-é)  

  * available for developer use
  * developed in the open
JAVA 7 újdonságok:

  
Features from Sun:

  * Modularization (JSR 294 plusz Jigsaw)
  * JSR 292: VM support for dymanic languages
  * JSR 203: More New I/O APIs (NIO2, File System API)  

  * JSR TBD: Small language changes (Safe rethrow, null dereference exceptions, type inference, multi-catch) Ezekről szavazni is lehet egy új whiteboard-ön a folyosón
  * 6u10 features: Java Kernel, Quickstarter, New Plug-in
Kis változások:

  * Stream Control Transmission Protocol
  * Sockets Direct Protocol
  * Method to close a URLClassLoader
  * Unicode 5 support
  * XRender pipeline for Java2D
  * Swing cuccok: JXLayer, DatePicker, és talán CSS styling
Sebesség:

  * HotSpot még okosabb
  * G1 garbage collector
  * Compressed-pointer 64-bit VM
  * talán: MVM - lite (Multiple Virtual Machnie)  

Features from others:

  * JSR 308: Annotations on Java Types (több mindenre lehet majd annotációkat használni. Pl. @Override mintájára @NonNull annotáció, ami statikus ellenőrzéséket implikál).
  * Concurrency and collections update
NEM lesz benne (várhatóan)

  * Closures (nincs megállapodás benne)  

  * Külső proposálok, amit túlságosan drága lenne megcsinálni: pl. Operator overloading, Bug Decimal syntax, First-class properties  

  * JSR-295: Beans Binding (JavaFX-ben van binding, nem akarnak másikat is)
**Várható időpont: Early 2010 **(ehhehh, úgyis a JavaOne-ig fog csúszni :-)  
  
Másik személyes megjegyzés: kicsit úgy tűnt, hogy a túl nagy közösségi
közreműködés, és a sok ötlet már-már ellehetetlenítette a Java7 kiadását.
Ezért úgy tűnik, a Sun inkább kihagyja, amiben túl nagy a vita (Closures) vagy
csinál belőle egy saját megoldást (modularizáció) a végtelen vita helyett
(JSR-277). Legalábbis ez az érzésem, nem tudom igaz-e. Én mindenesetre örülök
neki, már néha tényleg kicsit túl sok volt a pilpul.

