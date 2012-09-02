---
layout: post
title: Tomcat Xen alatt memory test
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2006/07/tomcat-xen-alatt-memory-test.html
---
Szóval mennyi memória kell egy xen dom1-nek, ha tomcat-et akarok futtatni
rajta. A dolog egyszerű:

1. default ubuntu dapper debootstrap
2. apt-get install sun-java5-jdk
3. wget tomcat 5.5, tar xvzf
4. startup.sh

Egyelőre nézzük az alap telepítést, különösebb app nélkül: 128 memória alatt
simán ment. Lemegyek 48-ra: az is megy.

Ez azért érdekes, mert a budget dedicated hasonló cucca 48 memórával meghallt.
Úgyértem el se indult.

Most 48-ccal simán megy, de annyira nem szép a helyzte, mert az oom killer
rendszeresen kilövi a tomcat-et memória hiánykor. Vissza 128-ra.

