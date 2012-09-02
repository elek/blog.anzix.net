---
layout: post
title: EP function
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2007/05/ep-function.html
---
Lehet, hogy mindenki ismeri, de nekem új volt: a kérdés az, hogy hogy lehet
EL-ben függvényt használni. És láss csodát, simán:

    
    
    <c:when test="${f:isValid(param1,param2)}" >
    

Azért ez szépen néz ki. Persze a prefix az egy tld, amiben function teggel
definiálható az isValid függvény. De inkább nézzétek meg a
[tutorialt](http://java.sun.com/j2ee/1.4/docs/tutorial/doc/JSPIntro7.html), az
teljesen egyértelmű. (scroll a végére).

  
Ti tényleg ismertétek?

