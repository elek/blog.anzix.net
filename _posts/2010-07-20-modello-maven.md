---
layout: post
title: Modello, Maven
tags:
- maven
- modello
- wtf
status: publish
type: post
published: true
meta:
  _edit_last: '2'
---
Egyszer már kitaláltuk egy kolegával (talán már le is írtam), hogy csinálni kéne egy kiégett Java blogot, ahol minden bejegyzés keserű kiábrándultsággal ostorozna valamilyen Java terméket vagy technológiát (user name: Thomas Bernhard). Az esetek nagyrészében bármilyen jó is legyen a program, fogást jó eséllyel lehet találni rajta.

A Mavenről pl. kevés ember hiszi, hogy egy jól megtervezett alkalmazást. Roszmájúak szerint csak egy kicsit kellett volna gondolkozni mielőtt elkezdték volna fejleszteni. Reálisabban úgy is lehet fogalmazni, hogy azóta mindenki sokat tapasztalt már a build tool businessben, ma már nyilván ezen tapasztalatok fényében jobb build tool-t lehet írni (hello gradle, hello buildr), de az utat kétségkívül a Maven taposta. És az is érthető, hogy amikor kezd de facto ipari standard lenni a Maven használata, akkor a Sonatype-nak nem érdeke egy nagy nem-kompatibilis refaktor. (Jó ilusztráció pl. a plexus IoC konténer használata, mivel amikor a Mavent elkezdték kalapálni a Spring nem volt még tényező, a Guice-ról még el se gondolkoztak. Viszont néhány ügyes varázslattal elég jó eredményeket értek el a Sonatype-osok a plexus&gt;guice migrációban, úgy hogy minden visszafelé is kompatibilis maradt).

De igazából nem is a Mavenről akartam írni, hanem <a href="modello.codehaus.org/">Modello</a>-ról. Azt is eltudom képzelni, hogy eredetileg volt valami érv a  használata mellett. De így kívülről a partvonalról nehezen tudom elképzelni ezeket az érveket. Azt értem, hogy mindenféle XML writer/reader-t generál, de ezekre azért vannak már dinamikus frameworkok is. És csak ezért felvenni a kód generálás keresztjét, mert akkor dom4j writer-t nem kell írni... Hát, nem tudom.

Ma pedig pont a maven release plugin patchelése közben találkoztam egy szép <a href="http://svn.apache.org/viewvc/maven/release/tags/maven-release-2.0/maven-release-manager/src/main/mdo/release-descriptor.mdo?revision=907327&amp;view=markup">MDO</a>-val. Na ezt az XML-Java turmixot magyarázzal el nekem valaki.
