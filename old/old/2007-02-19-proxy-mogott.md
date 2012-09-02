---
layout: post
title: Proxy mögött
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2007/02/proxy-mgtt.html
---
Tudom, hogy elenyésző azon esetek száma, amikor az éles szerver egy proxy
mögül zizegne, de a development környezetben ez nagyon is előfordul.

  
Mert van olyan, amikor egy servlet nyit egy TCP connection-t, és azon próbálna
kommunikálni valahová máshová (pl. OpenLaszlo, bizonyos OpenID
implementációk). Na már most, ha ennek kommunikációnak a céges proxyn
keresztül kéne hogy menjen, de ilyen lehetőségre a fejlesztők nem is
gondoltak. (Na jó OpenLaszloban gondoltak, de ott nem izzúlt be.)

  
Valmi OpenVPN-s dolgot nagyon össze kéne már gyúrni.

