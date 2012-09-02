---
layout: post
title: hg mq és a ci
tags:
- hg
- mq
status: publish
type: post
published: true
meta:
  _edit_last: '2'
---
<strong>UPDATE: </strong> OMG, mennyire felületes voltam. hg help qinit, és ne is olvassátok tovább. Ez mindent megoldott.

A .hgrc-mbe egyretöbb extension szivárog be:
<pre>[extensions]
hgshelve=/home/elek/satupad/hgshelve/hgshelve.py
hgext.fetch=
hgext.rebase=
hgext.graphlog =
transplant =
hgext.color =
hgext.purge =
hgext.mq =</pre>
Az egyik legújabb játékom az MQ extension. Nagyon nagy vonalakban arról van szó, hogy a rendes changelog tetején még ül egy rakás patch (konkrét patch fájl gyűjtemény egy könyvtárban), amik bár külön álló fájlok, az mq extension a saját parancsaival úgy kezeli, mint a hg changelogon szánkáznál időben előre és hátra.

Két tipikus használata van. Egyrészt el lehet játszani, hogy pullozok regy public repositoryból, és csinálok néhány patchet. Amikor frissítik a public repositoryt, akkor a patcheken időben visszalépkedek, ekkor changesetek helyett csak patch fájlok lesznek belőlük, pullozok egyet, és megint előre lépkedek és applyolom a patcheket.

(Ez így leírva kicsit bonyolultnak tűnik, de ki kell egyszer próbálni, és akkor érthetővé válik, én se nagyon értettem, amíg nem kezdtem el használni.)

Egy másik felhasználási mód, amikor szerkeszteni akarok egy commitot. Ilyenkor convertálom a changeseteket patchekké, a patch fileban szerkesztem (akár a commit message-t is), majd vissza konvertálom a patch changeseteket rendessé. Természetesen fizikailag ezek már más changesetek lesznek, tehát nem érdemes akkor próbálkozni ezzel, ha már pusholtuk is a changeseteket.

És most a probléma. Alapvetően ezt csináltam
<ol>
	<li>leszedtem az aspectj maven plugin-t svnből és egy svn hg bridge-en keresztül hg-be konvertáltam</li>
	<li>csináltam hozzá néhány patchet, hogy kicsit jobban működjön</li>
</ol>
A patchet ilyenkor a .hg/patches alá kerülnek. Akinek ott vannak a patchek alatt az én fájljaim az tudja buildelni az én változatomat, kinek nincs, az nem. Mivel azt akarom, hogy más is lássa a változtatásokat, ezért a hg qinit -c parancsot használtam, ami a .hg/patches-ben inicializál egy másik hg repót, ahol verziózza a patcheket. (E nélkül a patchek csak nálam lokálisan lennének meg).

A proléma az, hogy a .hg/patches repó természetesen egy másik repó, mint ami a fő kódot tartalmazza, és innentől kezdve egy rendes buildhez (pl. a Hudsonon) nem elég hg clone-t mondanom, hanem a hg clone után még a .hg/patches-hez egy másik hg clone is kéne, amit ugye a Hudson nem fog megcsinálni nekem.

Azt csinálhatnám, hogy a patcheimet átalakítom rendes changesetté, csak ezt meg pont nem akarom, mert akkor elveszik pl. a patch neve mint információ, meg a következő SVN frissítéskor kicsit bonyolult lenne a helyzet.
