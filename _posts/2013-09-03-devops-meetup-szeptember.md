---
layout: post
title: DevOpsBp Meetup szeptember
tags:
   - devops
   - prezi 
   - monitoring
date: 2013-09-03 22:10
---
Hétfőn sikerült eljutnom a [BP Devops Meetupra][1], ahol a Prezisek beszéltek arról, hogy ők mit használnak monitorozásra (és mit nem). Az előadás meghallgatható a [ustream csatornán][2], a prezentáció meg [itt][3] kattintgatható végig.

Mivel a hang is és a prezentáció is elérhető, ezért most részletesen nem ismertetném az előadást. A lényeg, hogy pár kitérő után a leggyorsabb megoldásnak azt találták, hogy [icinga][icinga] (a nagios tobább fejlesztett forkja) köré építettek fel mindent. Azzal van megbolondítva csak, hogy a Chef szkriptek segítenek legyártani a metrika gyűjtő szkripteket, és frissíteni az adatbázist, amiből az icinga config fog generálódnini. Icinga szerverekből vannak slave-ek (adatközpontonként), amik tovább adják az adatot a masternek.

A master aztán lerendezi amit kell, dashboardon mutatja, hogy ha baj van, elküldi egy [graphite](http://graphite.wikidot.com/)-nak az adatokat szép grafikonok miatt, valamit egy [gearman][4] job serveren keresztül saját szabályokat futtatnak, amik tudják hogy kell-e riasztani.

Néhány gondolat:

- Nem vagyok egy nagy graphite rajongó (egyszer majd hosszabban kifejtem miért). Nekem úgy tűnik, inkább azért használja mindenki, mert nincs sokkal jobb. Mindenesetre itt is ment oda példány az eseményekből, de ha jól láttam saját dashboardokba rakták be a grafikonokat APIn keresztül.

- Az egyik fő probléma volt, hogy a sok metrika miatt nagyon lassú az icinga restart az új (generált) configokkal.

- Másik fő probléma (ez nem volt nagy meglepetés), hogy az icinga szerverek polloznak ahelyett, hogy a gyűjtő processzorok push-olnának. Ha hálózati kiesés van, akkor senki nem cacheli a gyűjtési oldalon az adatokat. (Ezt a probléma nekem munin-ban szokott szembe jönni.)

- Mindezek ellenére, ha jól emlékszem 160 körüli szervert és 20000 körüli szolgáltatást monitoroznak, ami azért nem rossz. Látható, hogy ezek a fajta korlátok is csak nagyobb tételnél kezdenek előjönni.

- A logoknak teljesen más rendszerük van (!)

Ez utóbbi egyébként elég jellemző. Nekem legalábbis az  a benyomásom, hogy kismillió monitorozó eszköz van, de egy rendes setuphoz még mindig össze kell drótozni legalább hármat-négyet, mert nincs olyan, ami nagyon mindent lefedne. A Mozilla Heka rendszere, ami még gyerek cipőben jár, szintént erre a problémára jött létre. A bemutató [prezentációban](https://people.mozilla.com/~rmiller/heka-intro-2013-03/#/) jól körül van járva, hogy milyen fajta monitorozásra milyen rendszerek vannak, és miért akarnak ezek helyett egy közöset. Kár, hogy a Heka még csak ott tart, hogy egy ügyes event collector/transformer/router tud lassan lenni, ha sokáig konfiguráljuk. Mindenesetre szerintem az álom mindenképpen az, hogy a logok, a metrikák és a riasztások mind egy helyen legyenek sok keresztreferenciával.

Az előadásban (illetve utána a kérdésekbe) elhangzott még néhány, amit nem használnak:

- [Riemann](http://riemann.io/), ami egy ügyes event processor szervernek tűnik, clojure-ban lehet szabályokat irni, és elvileg indexelni is tud.
- [Sensu][5] monitoring (NEM: amellett, hogy nem volt kiforrott, kicsit fáztak a plusz RabbitMQ függőségtől)
- [OpenTSDB][6], ami a graphite-al ellentétben minden adatot örökre elment (nem csak agregátumokat) HBase adatbázisba. Mondjuk nem egy karcsú valami (HBase, tehát mellé jön még egy Zookeeper fürt), de ágyunak jó lehet.
- [Zabbix](http://www.zabbix.com/): Amit én sose használtam, de az a benyomásom, hogy leginkább az Icinga/Nagios térfélre lehet helyezni.




[1]: http://www.meetup.com/devopsbp/
[2]: http://www.ustream.tv/channel/devops-bp
[3]: http://prezi.com/gods6httowhq/devops-meetup-september-2013/
[icinga]: https://www.icinga.org/
[4]: http://www.gearman.org/
[5]: http://sensuapp.org/
[6]: http://opentsdb.net/