---
layout: post
title: Java Content Repository Browser
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2007/07/java-content-repository-browser.html
---
A JCR egyik hibájának szokták felróni, hogy nincs hozzá jó admin eszköz
(~pgAdmin, Toad). Kezdemények azért szerencsére már vannak. Ma kettő került az
utamba: A [JCR Controller](http://www.xs4all.nl/%7Eweertj/jcr/) és a [JCR
Browser](http://sourceforge.net/projects/jcrbrowser/).

  
Minkettő elég jó funkcionalitást biztosít, írni olvasni, exportálni importálni
lehet mindent. A JCR Controller webstartról indítható standalone program
([screenshot](http://www.xs4all.nl/%7Eweertj/jcr/jcre.png)), de sajnos
1280x87.. ra optimalizálták. Ezt azt jelenti, hogy 1024x768-as felbontásban
egyes mezők nem is láthatóak, nem érthetőek el. Ez azért eléggé lecsökkenti a
használhatóságot. (Már aki szintén sajnálta a pénzt, monitorra).

  
A JCR Controller, szintén friss fejlesztés, egy war file-t kell deployolni,
tehát webes, és belépéshez a repository JNDI címe és egy login név kell. A
kedves dolog az benne, hogy mivel tudja ugyanazt a repositoryt használni, amit
a webalkalmazásom, ezért nem kell JCR-RMI-t feltelepítenem, hogy megnézzem mi
van épp a repositoryban. Még elég nyers (pl. idiot-sicher validálások sokszor
hiányoznak), de működő és használható. Egyelőre ez marad.

  
BTW, kijött a JCR 2.0-ből a [Public
Review](http://jcp.org/en/jsr/detail?id=283).

