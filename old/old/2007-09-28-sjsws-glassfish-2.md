---
layout: post
title: SJSWS => Glassfish 2
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2007/09/sjsws-glassfish-2.html
---
Le kéne cserélni a Sun Java System Web Server-t Glassfishre. Nem csak azért,
mert a config deploy a SJSWS-nél bűn lassú (percekig tart), ezt talán be
lehetne jól konfigurálni, és nem is csak azért, hogy hódoljak a Glassfish
hype-nak, és trendi legyek, de jól jönne egy futó JBI konténer is, és a Web
Service támogatása is jobb. A baj csak az, hogy bár a Glassfish végre
nagyjából kezeli a virtual hostokat, egy csomó kényelmi szolgáltatás ami
webhostingolásnál hasznos nincs benne. Pl. nem lehet jól beállítani, hogy
egyes könyvtárakhoz csak jelszóval lehessen hozzáférni.

  
Az ideális az lenne, hogy ha lenne egy Servlet/Filterem-em, ami értelmezné a
.htaccess fájlokat, (legalább mondjuk a jelszós részeket, vagy ne adj isten a
ModeRewrite-ot is), és azt be tudnám deployolni default webappnak, ahová kéne.
Nem is lenne nagy dolog megírni, csak épp most úgy tűnik semmi időm nem lesz
ilyenre. Ha valaki tud ilyenről készen, az ne habozzon szólni (pl. Jettyben
láttam hasonlót, csak az nem csak egy servlet, hanem + kismillió függőség, nem
nagyon lehet kibányászni).

  
Ja meg PHP támoatás is kéne, de ez Scripting API-val + Quercus-szal simán
szerintem simán menni fog.

