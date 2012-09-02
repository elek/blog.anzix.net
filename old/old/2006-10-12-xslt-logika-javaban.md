---
layout: post
title: XSLT logika javaban
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2006/10/xslt-logika-javaban.html
---
Ezzel ax XSLT-ve en sohasem voltam kibekulve. Szep az elmelet, de ha bonyolult
dolog van, akkor az ember ugyis valami ertelmes programnyelvhez nyul
transzformaciohoz. Ha meg csak az alapdolgokhoz jo, akkor mi szukseg van
valami uj nyelvszeru dologra. (Gondolkodtam nagykepuen).

  
Jo, csinaljuk meg Javaban. Kell egy olyan dolog, ami vegigmegy az XML-fan,
minden node-nal megkeresi a legjobban illeszkedo szabalyt (az illeszkedest
tetszoleges bonyoult XPath-szal definialom), es lefuttatja.

  
Az hamar eldolt, hogy SAX nem lesz jo, hisz ott az Event fuggvenyek csak
string-eket kapnak, a dom poziciorol semmit sem tudnak, es a szabalybol sem
tudok kinezni a dom mas agai fele.

  
Akkor legyen DOM (ugye mindig mas XML kell, schema nem is bitos, hogy van
ezert a JAXB, ami szinten DOM szagu, nem jon szamitasba.). A problme az, hogy
meg nincsenek meg azok a fuggvenyek, amik a DOM fa kurrens poziciojanak XPath-
at ossze tudna vetni egy adott szabaly/listener elore, esetleg teljesen mas
alakban megadott szintakszisaval.

  
Viszont, egyreszt a Xalanban van XSLT motor, ugy hogy o megcsinalja valahogy,
illetve van meg az xsltc, ami java byte code-ot fordit xslt-bol (mar jol
hangzik). Szoval ilyen iranyban guglizunk tovabb.

