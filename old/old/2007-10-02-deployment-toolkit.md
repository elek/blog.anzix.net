---
layout: post
title: Deployment Toolkit
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2007/10/deployment-toolkit.html
---
A Java SE 6 Update N Early Access már elérhető, aminek a része a Deplyoment
Toolkit nevű kis játékszer is. Igazából egy .js fájl az egész, ami ad néhány
függvényt arra, hogy ellenőrizzük a felinstallált JRE verziót és ez alapján
kirajuk az appletet/web start linket, vagy elküldjök a usert java-t letölteni.

  
Nem néztem át persze a forrást, de az egész csak egy javascriptnek tűnik,
amihez nem is kell az Early Access, elég ha befűzzük a html-be ezt a
http://java.com/js/deployJava.js -et, és már mehet is.

  
function detectJRE() { var list = deployJava.getJREs(); if (list.length == 0)
{ alert ('No Detectable JREs are Installed'); } else { alert (list[0]); } }
[Itt ](detectJRE()) pl. megmondom neked a JRE verziódat.

    
    
    <script type="text/javascript" src="http://java.com/js/deployJava.js">
    <script>
    function detectJRE() {
        var list = deployJava.getJREs();
    
        if (list.length == 0)
        {
            alert ('No Detectable JREs are Installed');
        }
        else
        {
            alert (list[0]);
        }
    }
    </script>
    <a href="javascript:detectJRE()">Itt </a> pl. megmondom neked a JRE verziódat.
    

A példát [innen](https://jdk6.dev.java.net/testDT.html) másoltam ki, ahol
további részletek is találhatóak.

