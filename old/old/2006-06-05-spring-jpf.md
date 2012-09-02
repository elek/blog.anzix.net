---
layout: post
title: Spring + JPF
tags: 
 - spring
 - jpf
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_permalink: /2006/06/spring-jpf.html
---
Mai napi legnagyobb problémám, hogy a [Spring
frameworkot](http://www.springframework.org/) szeretném keresztezni valahogy a
Java Plugin Frameworkkel. Valahogy úgy, hogy egy könyvtárba berakok egy modult
és az beépüljön az egész oldalba.

Az, hogy ez nem JPF hekkelés lesz, hamar kiderült, ugyanis a JPF túlságosan
standalone application specifikus. (Bár a honlap szerint hamarosan előállnak
egy j2ee demóval is). Például egy boot plugin is kell hozzá, ami nekem nem
lesz, vagy újra kell írnom a betöltő folyamatot, amihez meg nincs kedvem.

Első nekifutásra elég egyszerűen megy, hogy a Spring beans.xml-ét több
könyvtárba szétdobjam, mert ant típusú /\*\*/ mintákat is elfogad a web.xml-ben
a dispatcher servlet init-paramban megadva.

Azt, hogy ezekben a könyvtárakban az osztályok is bekerüljenek a classpath-ba
már keményebb dió volt. Előszőr a DispatcherServlet lecserlésén fáradoztam, de
az sajnos egy harmadik gyerek, és még a második gyereknál bele van kódolva a
class loader a kódba. Szerencsére azonban kiderült, hogy az XML értelmező
contextClass szintén init-paramként megadható servleten és az
XmlWebApplicationContext-et vidáman lecserélhetem egy öröklött osztálya, ami a
konstruktorban létrehoz egy osztálbetöltőt és a setClassLoader-rel érvényt is
szerez neki.

