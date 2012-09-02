---
layout: post
title: ! 'Adam Warski: Envers - Easy Entity Versioning'
tags:
- Devoxx
- envers
- hibernate
- JPA
- verziózás
status: publish
type: post
published: true
meta: {}
---
Entitások verziózása a feladat (szép hosszan magyarázva). A subversion
hasonlat szerintem mindent elmondott róla előszőrre is. Revíziók vannak
(tranzakciókhoz kötve), külön táblákban tárolva a verziózott adatokat. A
legfrisseb változat továbbra is szabvány JPA-val kezelhető, és van egy saját
API a régi verziók előcsalogatásához. A verziózandó entitásokat meg kell
annotálni, a hibernate configba néhány property és már megy is.

  
Viszont: csak hibernate-tel megy (Toplinknek van más megoldása erre), tehát a
használatával pont a provider függetlenséget vesztem el. (És igen, nekünk
konkrétan előfordult már, hogy JPA providert váltottunk, tehát ez egy valós
probléma szerintem.).

  
Talán majd a JPA 3-ban.

  
ps: az Envers a hibernate projekt része lett

