---
layout: post
title: Wicket nyűgök
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2007/09/wicket-nygk.html
---
Na ez tipikusab olyan bejegyzés lesz, ami csak annak érdekes, aki szintén
benne van a Wicketben. Két probléma:

  
1. Ha a WicketFilter-t nem /app/*-ra, hanem /*-ra meppelem, akkor a HomePage-
ben a css hivatkozásot (default.css) helyelenul kicseréli egy ../default.cs-
re. Ugyanezt az egyenkint felmountolt aloldalakon helyesen oldja meg.
Próbáltam bug reportolni, de egyelőre még nem találtam meg, hol a hiba.
Workaround: a fő oldalt is fel kell monutolni az Application osztályba
valamilyen Bookmarkable címre.

  
2. Ha Rss-t csinálok
[ezzel](http://www.jroller.com/wireframe/entry/wicket_feedresource) a
módszerrel (Gyakorlatilag egyetlen bridge osztály a Rome használatához), akkor
nem csak, hogy nem működik, hanem az rss feed helyett kiírja $TOMCAT_HOME/bin
tartalmát. Na már most ezt se tudom kinek a hibája (Tomcat/Wicket/Wicket-
rome/saját magan), de ez így **nagyon durva**. Workaround még nincs. Mindjárt
megpróbálom Glassfish alatt. (BTW. tudtátok, hogy Glassfish 2 elvileg képes
értelmezni deploykor a tomcat-es context.xml-eket?)

