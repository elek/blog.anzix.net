---
layout: post
title: DOM4j vs JDOM
tags: 
- jdom
- xml
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2006/10/dom4j-vs-jdom.html
---
Vicces dolog két olyan library összehasonlítani, amiből az egyik utoljára
2004/09/09-ben a másik 2005/05/16 jött ki, és azóta semmi. Mindenesetre a
[JDOM](http://www.jdom.org/) és a [dom4j](http://www.dom4j.org/) is olyan
dolgokra jött lérte, amire elvileg sem a DOM sem a SAX nem képes.

  
Mindkettő tud írni és olvasni SAX-ból és DOM-ból. a JDOM azzal reklámozza
magát, hogy sokkal egyszerűbb, mert milyen jó dolog olyanokat írni, hogy

    Element e = new Element();

A dom4j ezzel szemben viszont sokkal jobb :-)

Jó elismerem, kell hozzá factory, hogy létrehozzunk egy új element-et (illetve
ez sem biztos, mert csak a gyökér elemhez kell, utána lehet az
element.addElement("gyerekteg") -gel is létrehozni új gyerek elemet, ami
visszaadja az új elementet.

  
Viszont cserébe minden csak interface. Alatta a beállításoknak megfelelően
különböző implementácíójú osztályok lehetnek. Van pl. olyan, ami egy kicsit
több memóriát eszik, de sokkal gyorsabban keres attributumokra, van olyan, ami
olyan dom4j komponens fát csinál, ami simán castolható DOM fává (nem kell egy
új DOM fát építeni a konvertálásnál), és ez azért elég szép dolog.

  
Van benne még mindenféle adapter Swing-es elemekhet (pl. TableModel), tud
XSLT-jellegű transzformációt (Rule-oknak hívja magát), amit két bejegyzéssel
ezelőtt szerettem volna. A gyerekeket meg tudja mondani List-ben, Iterátorban,
vagy egyenként (for ciklus). Szépen kezeli az XPath-t, keveset fogyaszt, és a
dokumentációja is egy újnyival több mind a JDOM-nak.

  

OD