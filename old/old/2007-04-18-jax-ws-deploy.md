---
layout: post
title: JAX-WS deploy
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2007/04/jax-ws-deploy.html
---
JAX-WS ugye meg van minenkinek? JAX-RPC utódja, és web service-eket lehet
benne varázsolni könnyedén (POJO + Annitationok, ahogy ezt már
[mások](http://xfire.codehaus.org/) is csinálták, csak most szabvány.) Éppen a
2.1-es van kijövőben.

  
Meg is írom benne szépen a service-t és deployolnám be, amikor kezdődnek a
problémák. Glassfish szépen meg is eszi, de a Sun Java System Web Server
(leírni is gyönyörűség ilyen frappáns rövid nevet :) nem. Hamar kiderül, hogy
azért nem, mert a [JSR-109](http://jcp.org/en/jsr/detail?id=109)-et, ami azt
biztosítaná, hogy mindenféle plus deployment descriptorozás nélkül hipp-hopp
működjön a WS, nem támogatja a Web Server. Persze trükközni lehet.
[Ez](http://developers.sun.com/webserver/reference/techart/websvcs_nb.html) a
kedves tutorial például (még a régi Web Serverhez tehát 2.4-es servlet
konténert használ) elmondja, hogy milyen com.sun-os osztályokat kell
servletként regisztrálni a web.xml-ben, hogy menjen a JAX-WS. Persze, a
referencia implementációval. De ennyi erővel ne csináljunk szabványt, csak
implementációt és dokumentációt.

  
A [JAX-WS FAQ](https://jax-ws.dev.java.net/faq/index.html#) ezt így fogalmazza
meg:

_Q. Is the stand alone JAX-WS-based service developed and deployed on Servlet
container is portable on all Java EE 5 based platforms ?

  
No._

  
Ennyi. Ott tartunk tehát, hogy JAVA 6 SE-ben lehet szabáványos hordozható WS
szervert/klienset csinálni. JAVA EE 5-ben (ami tartalmazza a JSR-109-et) lehet
szabványos hordozható WS-eket csinálni. Csak épp servlet containerek környékén
(ami azért ezen a területen mégis csak a legvalószínübb) nincs rá hordozható
megoldás.

