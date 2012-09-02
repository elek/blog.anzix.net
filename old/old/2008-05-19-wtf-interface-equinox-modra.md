---
layout: post
title: ! 'WTF: Interface Equinox módra'
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2008/05/wtf-interface-equinox-mdra.html
  _edit_last: '2'
---
Sajnos az OSGi nem tartalmaz szabványos interface-t a konzol szolgáltatásokra.
Konzolja azonban szinte minden OSGi frameworknek van, és általában ezeket
valahogy ki is lehet terjeszteni, hogy saját parancsaiddal bővítsd a
rendszert.

  
A Felix-ben pl. a SehllSerivce-t kell implementálni:

    
    public interface ShellService  
    {  
        public String[] getCommands();  
        public String getCommandUsage(String name);  
        public String getCommandDescription(String name);  
        public ServiceReference getCommandReference(String name);  
        public void executeCommand(  
            String commandLine, PrintStream out, PrintStream err)  
            throws Exception;  
    }  
      
    

Ez a dokumentáció nélkül is körülbelül érhető. De hogy csinálja mindezt az
Equinox?

  
Nos előszőr is implementálni kell egy CommandProvider interface-t. Ezek után
pedig minden metódus, ahol a metódusnév _-al (aláhúzással) kezdődik
automatikusa a konzolból is elérhető parancs lesz. Az én konzervatív OOP-s
lelkemnek ez már határeset.

Jó, jó, legyen egyszerű, de nem gányolás ez kicsit?

  
  

