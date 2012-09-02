---
layout: post
title: Java PDF2HTML
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2008/05/java-pdf2html.html
  _edit_last: '2'
---
A mai nap egy régi XSL-FO-s rendszert kellett volna újraéleszteni az új
környezetbe, hogy HTML-t PDF-en keresztül tegyünk szépen nyomtathatóvá.

  
Biztos ami biztos előtte azért körbenéztem, és azt
[találtam](http://itext.ugent.be/library/question.php?id=40), hogy létezik
egyszerűbb megoldás is. Pl. az
[xhtmlrenderer](https://xhtmlrenderer.dev.java.net/) pont tudja ezt
[iText](http://www.lowagie.com/iText/)-en keresztül.

  
Van hozzá egy jó részletes [cikk](http://today.java.net/pub/a/today/2007/06/26
/generating-pdfs-with-flying-saucer-and-itext.html), és azt kell mondanom,
hogy tényleg működik. A prototípus probléma nélkül csinálja a dolgát (pedig
még némi iText varázslattal meg van bonyolítva).

  
Szóval eddig jó, remélem a UseCase-ek implementálása közben is ugyanilyen
elégedett leszek.

  

