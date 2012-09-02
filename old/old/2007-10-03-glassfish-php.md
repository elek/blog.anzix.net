---
layout: post
title: Glassfish + PHP
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2007/10/glassfish-php.html
---
Egyik [előző](http://jtechnics.anzix.net/2007/09/sjsws-glassfish-2.html)
bejegyzésemben azt állítottam, hogy hej-de-egyszerű lesz Glassfish-t ellátani
globális php értelmezési lehetőséggel. Azt akarom ugyanis, hogy az összes
virtual host-on, ha valaki a documentroot-ba másol egy php alkalmazást, az
minden további nélkül működjön. Csakhogy a dolog mégse olyan egyszerű

  
A Resin-ből vidáman kinyerhető a
[Quercus](http://www.caucho.com/resin-3.1/doc/quercus.xtp), a Scripting api-ra
is illeszkedő Javaban írt PHP motor, de ezt alapértelmezetten szeretném
bekapcsolni. Ezt meg is csináltam: a default-web.xml definiáltam egy servlet-
et (com.caucho.quercus.servlet.QuercusServlet) és meppeltem a *.php-re. A sima
php ment is, de sajnos a mysq_connect-et már nem sikerült megugrani. A Quercus
ugyanis valami megmagyarázhatatlan oknál fogva nem hajlandó sima adatbázis
kapcsolatot kezdeményezni, hanem a servlet init paraméterei között meg kell
adni egy jdni nevet, és onnantól kezdve a mysql_connect-nek bármilyen
paramétert adhatunk meg, úgyis azok helyett inkább a jndi-t használja. Ez
egyrészt kedves dolog, mert lehetne PHP-s alkalmazást futtatni connection pool
helyett, másrészt elég szar, mert kötelező és egy globális php servlet
lehetőségét teljesen ellehetetleníti. Nem lehet/és nem is akarnék az összes
hostolt php alkalmazáshoz külön mysql DataSource regisztrációt.

