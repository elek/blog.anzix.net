---
layout: post
title: Mikrokernel és kampók
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2006/12/mikrokernel-s-kampk.html
---
Az álmom továbbra is ugyanat. Egy j2ee-s (de legalább is web kontainerbe futó)
mikrokerneles moduláris alkalmazást találni/írni. Néha, ha ez rámjön, akkor
elkezdek guglizni, és olyanokról olvasok, mint a
[HiveMind,](http://hivemind.apache.org/) vagy az [OSGi](http://www.osgi.org/).

  
Az OSGi különösen szimpatikus, van benne dependency kezelés, modularitás,
futás közben-i deploy. Az egyetlen, ami hiányzik ezekből a rendszerekből, az a
hook rendszer, amire szintén ácsingózok.

  
Aztán belegondoltam és rájöttem, hogy ez teljesen érthető. Ha van lehetőség
egy szolgáltatást (interface-t) publikálni, és azt más szolgáltatásokból
meghívni, akkor a publish/subscribe minta szerint már vidáman lehet remek hook
rendszereket képezni bármelyi felé.

  
Valahogy így képzelem:

Van egy HookSystem.java, ahová regisztrálni lehet egy interface konkrét
implementációit (akár többet is)

    //publish service
    public void create(Class interfacez);
    
    //subscribe to service
    public void register(Class interfacez,Object o);
    
    //execute the hook
    
    public Object getHook(Class interfacez);

  
Például:

    HookSystem system = new HookSystem();
    
    //publish
    
    system.create(hookertest.Hook.class);

    //suscribe
    
    system.register(hookertest.Hook.class,new HookImpl1());
    
    system.register(hookertest.Hook.class,new HookImpl2());
    
    //get the executor
    
    Hook hook = (Hook) system.getHook(hookertest.Hook.class);
    
    hook.print("asdx");

Természetesen a két HookImpl* implementálja a Hook-ot.

  
Aztán van egy parancs, ami meghívja az összes implementációt, aki
regisztrálvan van. A vicc kedvéért ezt a HookSystem.getHook-on keresztül
csinálnám, ami egy proxyt ad vissza a Hook interface-re, de bármit meghívva
rajta az összes implementáló osztály végighívja a paraméterekkel (a
visszatérési értékek kezelésén még gondolkozom, egyelőre legyen mindenki void,
és a paraméterekbe irkálljon. Továbbá az is gyanús, hogy szép generic-kekkel
még meg lehetne bolondítani az egészet.)

Hát így. Hook rendszerem van. Már csak valamelyik mikrokernel cuccost kéne
átlátni.

