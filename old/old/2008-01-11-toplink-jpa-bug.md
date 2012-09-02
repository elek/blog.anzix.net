---
layout: post
title: Toplink JPA bug
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2008/01/toplink-jpa-bug.html
---
Mindig öröm, ha egy komoly termékben néhány órás szívással izolálni tudunk egy
hibát, és végre kiderül, hogy nem mi voltunk a hibásak. Most az történt, hogy
Joined table inheritance strategyt használtunk és left joint és a Toplink
Essential a discriminator value-t inner join-nal kezelte. Magyarul nem lehet
left joint csinálni, hiába írom be a querybe.. Ki próbáltam Hibernate JPA-val
is (ugye milyen jó, hogy hipp-hopp váltogatni lehet a providerek között?), és
azzal rendesen ment.

  
Akkor most
[bugreport](https://glassfish.dev.java.net/issues/show_bug.cgi?id=3995) és
native queryk használata a bugfixig.

