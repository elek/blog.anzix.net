---
layout: post
title: Kedvenc Hudson pluginjeIm
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2008/04/kedvenc-hudson-pluginjem.html
  _edit_last: '2'
---
Már lassan több mint három hónapja használjuk nap mint nap a <a href="http://www.blogger.com/hudson.dev.java.net">Hudson</a>-t mint CI szervert, és továbbra is meg vagyok elégedve vele. Igazából lehet, hogy más ugyanilyen kényelmes CI szerver is van, én ezzel kezdtem, és ennél maradtam.

Az egyik legnagyobb előnye, hogy jól bővíthető, van is hozzá egy rakás <a href="http://hudson.gotdns.com/wiki/display/HUDSON/Plugins">plugin</a>.

Mi most az alábbiakat használjuk:

<ul><li><a href="http://hudson.gotdns.com/wiki/display/HUDSON/Jabber+Plugin">Jabber</a> plugin, aki szól nekem rögtön, ha valami nem kóser (emelett persze emailt is küld).</li><li><a href="http://hudson.gotdns.com/wiki/display/HUDSON/Violations+Plugin">Violations</a> plugin egyelőre csak a PMD eredményeit mutatja grafikonon (meg persze a részletes hibajegyzéket is meglehet nézni). Ha nem is olyan szép design mint a <a href="http://sonar.hortis.ch/">Sonar</a>, de azért elég jól megteszi, és legalább a CI-ben vannak ezek az adatok is.</li><li><a href="http://hudson.gotdns.com/wiki/display/HUDSON/SCP+plugin">SCP</a> plugin: a kész artifactokat tolja fel a publikus szerverre (így egy belső gépen buildelhetünk, és az interneten kint lévőn csak az eredmény van.</li><li>+1 Nem használjuk, de van még egy említésre méltó plugin az <a href="http://hudson.gotdns.com/wiki/display/HUDSON/Emotional+Hudson+Plugin">Emotional</a>, ami azt a hasznos funkciót valósítja meg, hogy ha eltörik a build, akkor a Hudson logója (bajszos bácsi) nagyon mogorván néz a háttérben. KIhagyhatatlan :-)
</li></ul>Egyébként a harmadik pontot a Glassfish még viccesebben <a href="http://blogs.sun.com/theaquarium/entry/hudson_dashboard_for_glassfish_builds">oldja meg</a>. Ott van egy belső fordító gép park, és az a belső Hudson összes eredményét egy pluginon keresztül egy külső Hudson-ra nyomja ki.

Öröm és boldogság.
<
