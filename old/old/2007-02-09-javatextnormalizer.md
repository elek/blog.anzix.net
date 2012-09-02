---
layout: post
title: java.text.Normalizer
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2007/02/javatextnormalizer.html
---
[Itt](http://weblogs.java.net/blog/joconner/archive/2007/02/normalization_c.ht
ml) olvasom: azt hinné az ember, hogy ha UTF-8at használ, akkor már többet nem
lesz semmi baj az ékezetekkel, pedig de: mivel az ékezetes karaktereket lehet
több karakterből is összrakni az Unicode-ba, de sokszor van egy egy karakteres
rövidítés is rá.

A cikk példája, hogy vilálog legyen:

    
    
    String name1 = "Jos\u00E9";       // José with precomposed é
    String name2 = "Jos\u0065\u0301"; // José with combining sequence e + ´
    

  
Aze a kettő ugyanúgy jelenik meg

  
A java.text.Normalizer mindig közös alakra hozza a Stringeket, így kereshetővé
és összehasonlóvá teszi. Persze csak 1.6 alatt működik, és azért nekem van egy
tippem, hogy mondjuk egy webes alkalmazásnál hány ember fog a beviteli formban
composite uncide karaktereket használni.

  
Vagy lehet, hogy egy tisztességes DB kezelő az egészet lekezeli, és csak
mondjuk file műveleteknél kell vele foglalkozni?

  
Vajon ékezetes domaineknél ez kettő külön domainnek számít? Nyilván ott is
kell lennie valami normalizálásnak.

