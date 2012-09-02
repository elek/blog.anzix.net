---
layout: post
title: Highlight autoboxing
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2007/11/highlight-autoboxing.html
---
Annó még egy régi interjún nyomták kezemben ezt a kérdést: Milyen i és j
értéket tudnál beállítani, hogy végtelen ciklust csinálj:

    
    
    while (i <= j && j <= i && i!= j) { ... }
    

  
A kérdés persze annyira nem bonyolult annak, aki hallott már az
[autoboxingról](http://jhacks.anzix.net/space/Autoboxing), és talán az
interjúztató még hintelt is, hogy 1.5-ös Java-ról van szó. Most is csak azért
jutott eszembe, mert a NetBeans hírlevél kiemelte [ezt](http://plugins.netbean
s.org/PluginPortal/faces/PluginDetailPage.jsp?pluginid=4130) a NetBeans
plugint, és én meg elgondolkoztam, hogy talán tényleg nem teljesen haszontalan
valami szolid highlight-tal jelölni az Unboxing/Boxing eseteket. Különben is
egyre szinesebb az IDE-m, szinte öröm leülni elé, akkor már had legyen benne
ez is.

  
ps: a rejtvény egyébként a 2006-is JavaOne TODAY című újságjában jelent meg
Neal Gafter and Joshua Bloch cikkében, akik a [Java
Puzzlers](http://www.overstock.com/Books-Movies-Music-Games/Java-
Puzzlers/1391224/product.html?cid=80486&fp=F)-nek is az írói. A cikk
részleteiben és megoldás magyarázattal
[itt.](http://java.sun.com/javaone/sf/2006/JavaOne_D1_LowRes.pdf)

  

