---
layout: post
title: Session cookie
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2006/09/session-cookie.html
---
Jó dolog ez a jcp igazán, szórakozásnak se utolsó olvasni a specifikációkat és
a szavazásokat. Hanem az kezd igazan jo lenni, amikor kevésnek bizonyul
speckó.

Pl. szeretnék olyan session-t, ami megmarad 1 napig, mégha a böngészőt be is
zárom. Ezt nem tudom (eddig nem sikerült) megcsinálnom. A session cookie
ugyanis Expired kitétel nélkül jön le, tehát addig él, ameddig a böngészőmet
bezárom. (Legalább is ez a tapasztalatom. A 2.4-es Servlet speckóból semit sem
találtam az ügyre vonatkozóan).

A session cookie-t nem lehet lekérdezni az apival (bár gyártó függő csomagok
néha vannak, de azt ugye azért mégsem). Tehát nem marad semmi eszközöm arra,
hogy befolyásoljam a session cookie életét.

Előszőr arra gondoltam, hogy valami Listenerrel megfogom a requesteket, és
amikor új session(isNew) van, akkor megfogom a cookie-t. De hamar rajottem,
hogy ehhez a request (amibol a session jön) es a response (amibe a cookie-kat
dobaljuk) is kell.

Akkor jott a filter. Ott megvan mindkettő, de tüzetesebben vizsgálva
szembeötlő, hogy a Cookie-kat csak befele dobalni tudom lekérni egyáltalan
nem. Na erre hamarabb is rájöhettem volna.

Akkor csinálok egy HttpServletResponseWrapper-t a filterben es azt adom tovább
a chain-nak és a setCookie metodusaban árgus szemekkel figyelek: ezt is hiába,
mert semmi nem törtenik. Valószinűleg a hasznalt implementáció közvetlenül a
writer-be nyomta bele a cookie headert. Vegül is senki nem irja elő, hogy a
setCookie-t kell használni.

Na itt adtam fel. Talán még az lenne megoldas, hogy egy Wrapper osztállyal az
egész Response outputot bufferelem, ha még nem volt session, és a végen
parsolom a header-t. Na de ez már olyan nagy áldozat lenne, hogy inkább
alábbadok az igenyeimből. (Vagy ilyenkor kene hozzaszolni a JSR-hez?)

