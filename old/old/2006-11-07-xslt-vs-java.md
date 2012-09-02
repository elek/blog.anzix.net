---
layout: post
title: XSLT vs. Java
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2006/11/xslt-vs-java.html
---
Azt hiszem már írtam arról, hogy miért vagyok XSLT ellenes. Már már
programnyelv bonyolultságú, de komolyabb dolgokhoz kevés benne a lehetőség.
Nem is szólva, ha az egészet Java-ban írnánk meg, akkor mennyivel több
funkciót használhatnánk átalakításkor (pl. adatbázis elérés).

(És akor nem beszéltünk a tesztelésről.)

  
Most olvasomtam itt: [Simple Xalan excension function](http://www-128.ibm.com/
developerworks/java/library/x-xalanextensions.html?ca=drs-), hogy ez másnak is
hiányzik: Xalan-ból kis namespace trükközéssel meg lehet hívni bármilyen Java
függvényt. Persze innentől kezdve Xalan specifikus lesz az XSLT-nk.

  
Úgyhogy akkor én már inkább maradok a dom4-jnél, ahol egy az egyben lekódolták
az XSLT algoritmusát Javaban, és egy egyszerű apin keresztül lehet XPath alapú
[rule-okat mondani](http://www.dom4j.org/cookbook.html#Introducing_dom4j_s_dec
larative_rule_processing). Jelentem használom és működik.

  
  
  
  
  

