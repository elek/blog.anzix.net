---
layout: post
title: Command line CI
tags:
- aws
- cerberus
- ci
- hudson
status: publish
type: post
published: true
meta:
  _edit_last: '1'
  _wp_old_slug: ''
---
Az elmúlt hetek legjobb híre az volt, hogy megjelent az Amazon EC2 gépek közül a micro méret. Ebben csak 600 MB memória van viszont az ára is ehhez van mérve (2 cent/óra). Ez már elég kedvező, gyakorlatilag pár ezer forintért lehet futtatni teljes értékű szervert.

Jelen blog is éppen egy AWS példányon fut valahol a tengeren túlon (ezt persze az éles szeműek nyilván észrevették az IP címváltozásból is).

A 600 MB viszont bölcs takarékosságra neveli az embert. Apache Httpd helyett lighthttpd + mysql + alaprdendszer, ez körülbelül 100-150 Mb-t eszik. Egy Hudson körülbelül ugyanennyit alapjáraton, de azt gyanítom a pluginekkel és projektekkel még hízik.

A Hudson amúgy szerintem az egyik legjobb Java-s alkalmazás. Nagyon sok részéről süt, hogy ezt használatra találták ki. Pl. webes felületen keresztül frissíthető, telepíthető bele plugin. Tisztára mint egy jó értelemben vett termék.

A 600 MB memóriámnak a negyedét viszont lehet, hogy sajnálnám tőle. Elkezdtem gondolkozni egy command line CI szerveren. A cron töltené be az ütemező szerepét az hívna meg valamilyen (script?) nyelven implementált kis belső magot, ami ellenőrizné, hogy van-e változás az SCM-ben, és ha van elindítaná a fordítást. A fordítás eredményéről értesítéseket küldene, és statikus HTML oldalakat generálna. Végül is a buildek eredménye bőven elég statikusan.

Eddig (kis keresgélés után) találtam is egy ehhez hasonlót <a href="http://cerberus.rubyforge.org/">Cerberus</a> néven. Igaz egyelőre elég alap funkcionalitással bír, pl. HTML oldalakat nem generál, csak értesít, de talán kiindulásnak jó lesz. Forkolni kéne egy üres órámban.
