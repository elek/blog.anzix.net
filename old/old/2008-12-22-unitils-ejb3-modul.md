---
layout: post
title: Unitils EJB3 modul
tags:
- ejb3. test
- junit
- unitils
status: publish
type: post
published: true
meta:
  _edit_last: '2'
---
Az <a href="http://unitils.org">Unitils</a>-ről szerintem már volt szó itt is: egy nagyon szimpatikus teszt keretrendszer, ami a JUnit és a TestNG tesztek írását tudja nagyon kellemesen megtámogatni. Különböző modulok vannak hozzá (dbunit, Hibernate, JPA EasyMock, Spring) és ezek teszteléséhez egy nagyon használható környzetet ad, ahol annotációk könnyítik meg az életünket.

Most az egyik projektünk a vége felé jár, amiben ezt használtuk EJB3 tesztelésre, és mivel ez a része a projektnek általánosabb a többinék kifaktoráltunk open sourcenak.

A lényege a modulnak, hogy a teszt osztályokat nagyjából úgy lehet használni, mint egy EJB osztályt. Lehet bennük használni a @EJB-t, a @PersistenceContext-stb. és a modul elintézi, hogy az EJB-k ott is legyenek beleinjektálva a teszt lefutása előtt.

A projekt státusza stabil béta: kb. egy éve használjuk egy projektben nagy megelégedéssel: ami implementálva van az stabilan működik, ami nincs implementálva benne (pl. tranzakciós annotációk) azok stabilan nem működnek.

<strong><a href="http://code.google.com/p/unitils-ejb3/">Unitils EJB module a google code-on.</a>
</strong>
