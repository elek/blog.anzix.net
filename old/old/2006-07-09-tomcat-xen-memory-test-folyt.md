---
layout: post
title: Tomcat Xen memory test folyt.
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2006/07/tomcat-xen-memory-test-folyt.html
---
[![](http://photos1.blogger.com/blogger/7100/3118/320/munin.png)](http://photo
s1.blogger.com/blogger/7100/3118/1600/munin.png) 

A dolog most így áll: a szerveren postgresql 8.1, tomcat 5.5 és egy alap spring framework alapú AJAX-
os j2ee alkalmazás. (Meg presze munin-node, amivel a grafikont csináltam). Úgy
tűnik ennyi még éppen belefér a 128 megába. (a zöld, amit használok, a
cache-t, ha jól tudom, még fel tudnám használni)

UPDATE: úgy tűnik hosszú távons is bírja. Amióta 128-on megy, még nem volt oom
killer.

