---
layout: post
title: Cargo deploy?
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2007/03/cargo-deploy.html
---
A [Cargo](http://www.jhacks.hu/space/cargo)-val is úgy voltam eddig, hogy
láttam, hogy van, és jó, és majd kipróbálom amikor szükgségem lesz rá. Most
lenne, mert Netbeans 5.5-öm még mindig nem támogatja a Tomcat 6-ot, márpedig
kéne egy Glassfishnél kissebb memória igényűbb JAVAEE 5 Servlet container.

  
Nosze hegesszük be a NetBeans-be. A NetBeans-ben az szeretem, hogy ANT az
egész, ezért viszonylag jól bele lehet nyúlni a build processbe. Be is
üzemeltem a cargot a doksi alapján, de sajnos csak azt sikerült elérnem, hogy
elindítja az ANT task a tomcat-et, úgy, hogy beledeploy-olja a war-omat. De a
lényeg az lenne, hogy a Tomcat fut, és alá hotdeply-al mindig frissíti az
alkalmazást. De pont ez a HotDeploy, amit sehol sem találok:

  
_Cargo offers a Deployer interface that container implementations can
implement to perform hot deployments. At the moment, the following
implementations exist:

  
* ResinDeployer  
* JettyDeployer  
* Jo1xDeployer  
  
  
See the Deployer page for more information on how to perform a hot deployment.
You can also deploy Deployables before the container is started using Static
Deployment._

  
Nagyon úgy tűnik, hogy pont ezt nem tudja (ANTból legalább is), szóval
közelről már kevésbé fényes a dolog.

  
Na mindegy, már húzom le a redőnyt, holnap meg megpróbálok egy context-et
ráirányítani a build dir-re.

