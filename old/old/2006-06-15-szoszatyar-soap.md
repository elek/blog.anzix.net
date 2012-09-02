---
layout: post
title: Szószátyár SOAP
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2006/06/szsztyr-soap.html
---
Már épp ittam a győzelmi pezsgőt, hogy mennyire faszán beillesztettem a SOAP-
ot az appomba, amikor megmértem mennyi megy át a hálón, és lefagyott az
arcomról a mosoly. Arról nem is beszélve, hogy amikor két objektum egy-egy
osztályváltozójában ugyanarra a másik objektumra mutat a referencia, akkor
SOAP után az két külön objektum lesz.

Kipróbáltam a [hessian](http://www.caucho.com/hessian/)-t is, az remek bináris
formátumban eregeti az adaokat és ráadásul a referenciák is megmaradnak. Kár,
hogy a hessian kissé alul van dokumentálva. Például sehol se találom, hogy a
POST kérést hogy kell felépítenem, hogy menézhessem mennyi adat megy át a
hálón.

