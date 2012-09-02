---
layout: post
title: servlet 2.5 / jsp 2.1 web container?
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2007/02/servlet-25-jsp-21-web-container.html
---
Sikeresen portoltam JSF 1.1-ről 1.2-re a picipuha-majd-elkészül
alkalmazásomat. Persze a kérdés még mindig ott van, hogy mi fogja hajtani. JSF
1.2, azaz JSP 2.1 kéne.

  
Tomcatből a 6-os még mindig béta. 5.5 nem tujda. :(

  
Jetty-hez a fejlesztőeszköz (NetBeans) integráció nem megoldott (bár egy ilyen
modult talán össze is dobnék), meg egy kicsit gyanús is, amikor azt írják,
hogy 2.5-ös servlet container, de azért a dependency injection nem működik.

  
Glassfish az igen. Az nagyon szépen muzsikál, a Jackrabbit JCR-t is JCA-n
keresztül simán vitte. Kár, hogy egy sima start 50-60 mega Heap-et eszik a
Tomcat 5-6-jával szemben. (Jconsole) Ez azt jelenti, hogy a 200 megás
szerveren elég necces lenne.

  
Tovább:

Kideríteni, hogy hogy lehet Glassfish szolgáltatásait szelektíven indítani
(pl. ejb/JMS momentán még nem kell nekem.

Vajon ha a Grizzly-t teszem be jetty-be vagy tomcat 5.5-be (jettyhez már
láttam nyomokat, hogy lehet), akkor servlet 2.5-öt kapok, vagy egész más
szint?

