---
layout: post
title: ANT custom selector
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2007/02/ant-custom-selector.html
---
Nekem pl. új volt.

  

    
    
    <fileset id="activefiles" dir="${workdir}">
    <custom classname="net.anzix.ant.ucm.ActFilesSelector" classpath="dist/UCMReporter.jar"/>
    &lt/fileset>
    

Nem taskdef-et használunk, hanem custom selector-t. A fileset végig megy az
összes fájlon, és a selectortól megkérdezi, hogy szerinte benne legyen-e a
filesetben az a fájl:

    
    
    public boolean isSelected(File basedir, String filename, File file) throws BuildException {
    

Nekem azért kellett, mert egy java osztályom visszaad egy file tömböt
(ClearQuest-ben érintett fájlok, command line wrapperből szedve), és azt be
akaromtam rakni egy filesetbe, úgy hogy később még exlude/includolni lehessen
rajta az ANT-ban. Na erre pl. nem túl hatékony a módszer, de ameddig így is 3
mp alatt kijön az eredmény, egyelőre ez lesz.

