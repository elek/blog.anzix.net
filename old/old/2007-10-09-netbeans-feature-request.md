---
layout: post
title: NetBeans Feature Request
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2007/10/netbeans-feature-request.html
---
Szóval elmondom mi az az egyetlen dolog, ami hiányzik nekem a NetBeans-ben:

  
Van ugye a Library Manager. Itt létrehozhatok egy új nevet, és adhatok hozzá 3
dolgot: classpath-t, javadoc helyet, és source-ot. Aztán ha ezt a nevet
hozzáadom a project-hez a libraryk közé, akkor a fordítás szépen használja a
classpath-t, és az IDE meg használja a javadoc és source helyekről beindexelt
információt.

  
Csakhogy, ha átmegyek egy másik helyre, a másik NetBeans-en ugyanígy létre
kell hozni ugyanazzal a névvel a library-t, hogy működjön. Elvileg lehetne
azt, hogy csak a JAR-filet adom hozzá (akár property fájlból, akár IDE-ből),
de akkor a library meg is lesz a másik helyen (mellé rakom), de a javadoc és a
source nem.

  
A NetBeans-ben pont azt szeretem, hogy ANT alapú és bármit meg lehet benne
csinálni. De egy jó hordozható projecthez még ez az egy hiányzik, hogy project
property fájlba tudjam definiálni a code-comlpete-hez használandó source és
javadoc helyeket.

