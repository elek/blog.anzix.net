---
layout: post
title: OSGi server-side
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2007/07/osgi-server-side.html
---
Még rég volt utoljára, amikor az OSGi-vel foglalkoztam, akkor még amikor a
Server-side OSGi szóba került, a FAQ-k általában azt mondták, hogy ne kelljen
nekem olyan, mert úgy is van OSGi webserver bundle, és na akarjam meglévő
appszerveremet használni. Ami azért nem annyira szimpatikus hozzáálás.

  
Most a TSSJS EU-n láttam egy bemutatót, hogy az Equinoxra (az Eclipse alatt
lévő OSGi implementációra) elkészült egy servletes bridge is.

  
A dolog nagyon egyszerű:

  * Töltsd le [innen](http://www.eclipse.org/equinox/server/http_in_container.php) a [bridge.war](http://www.eclipse.org/equinox/server/downloads/bridge.war)-t.
  * Deployold egy web containerbe.
  * Indítsd el a webcontainer-t úgy, hogy a standard input megmaradjon (defaultból da kapod az OSGi konzolt). Tomcat-ben pl. a ./catalina.sh run a nyerő megoldás.
És megy is minden szépen. A console magáért beszél.

Ha deployolni akarsz bele OSGi dolgokat, arra is [ott
van](http://www.eclipse.org/equinox/server/downloads/sample-http.zip) a példa.
Persze csak Eclipse-el fordítható (Ant?, Maven?), de utána a kapott jar-t már
deployolhatjuk az OSGi konténerbe:

  
install file:///home/user/samplehttp.jar

  
Utána ss paranccsal látjuk, hogy megette-e, és start number paranccsal
indíthatjuk is (a number az ss-sel kiírt sorszámot jelenti.) Még egy ss és
látjuk, hogy a sample.http_1.0.0 Active. Nézzük is meg a
http://localhost:8080/bridge/helloworld címet, és működnie kell a szervernek.

  
Ezek után, ha a JAR-t újra fordítjuk a konzolból újra tölthetjük anélkül, hogy
a servletünk leállna, ami teljesen rendben van.

  
Belenézve a samplehttp forrásába két érdekes dolgot látunk. Egyrészt az
Activator (ami betöltéskor hívódik meg) regsiztrálja a servletünket a context
alá:

  
httpService.registerServlet("/helloworld", new HelloWorldServlet(), null,
null);

  
Logikusnak hangzik, mivel innentől egy szerverünk van, ami alatt komponensek
és a fő szervletnek a web.xml-éhez már nem nyúlhatunk, hogy a servlet
mappinget piszkáljuk.

  
A másik, hogy az egész kódban sehol se hivatkoznak eclipse.org osztályra. Azaz
az egész servletes regisztrálós dolog az OSGi szabvány része, valamint
valószínű a szabvány további szolgáltatásai is (pl. Logging services) konkrét
interfacek megadását is jelentik. (Ez még ellenőrizendő).

  
Mindenesetre pazar cucc az egész moduláris web alkalmazások írására, mivel a
class loader nyűgöket rendesen kezeli az OSGi, és alapból neked csak annyit
kel csinálni, hogy ésszerűen modulokba rendezn a kódot és szétcsapni részekre.
És akkor persze majd lehet csinálni az extension pontokat, (erre is van benne
támogatás, csak még nem láttam).

  
(BTW megalakult a JSR-316 néven a JAVAEE 6, ami újra felkavarta a JSR-277 vs.
OSGi [vitát](http://www.eclipsezone.com/eclipse/forums/t98330.rhtml), mivel
egyértelműen leszögezte, hogy mivel a JAVAEE 7 JSR-277-re fog épülni, ezért
szó sem lehet OSGi-ról. )

  

