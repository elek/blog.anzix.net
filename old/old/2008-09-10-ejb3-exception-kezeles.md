---
layout: post
title: EJB3 Exception kezelés
tags:
- ejb
- ejb3
- exception
status: publish
type: post
published: true
meta:
  _edit_last: '2'
---
Az EJB világa kétfajta exception-t ismer, az alkalmazás (<em>application</em>) és a rendszer (<em>system</em>) exception-t. leegyszerűsítve a dolgot az alkalmazás exception olyan, amit én hozok létre, és odaírom az üzleti metódusaim deklarációhoz, tehát számítok rá. A rendszer exception minden, amit a konténer dobál nekem (pontosabban fogalmazva java.rmi.RemoteException, vagy bármilyen gyereke), plusz az összes unchecked exception (tehát olyan, amire nem számítok, és elvileg elő se fordulhat: pl. NullPointerException).

Ha alkalmazás exception dobódik, akkor - a loggoláson túl - a konténer nem csinál semmit, csak az exception-t tovább adja a hívónak. Ha rendszer exception dobódik, akkor viszont a konténer az aktuális Bean-t úgy ahogy van kidobja (még az interceptorok se hívódnak meg róla), ha van aktuális tranzakció, akkor azt rollback-re állítja, és az eredeti exception <em>helyett</em> egy EJBException-t dob (és persze loggol).

Na most nekünk arra van szükségünk, hogy ha valami ilyen váratlan hiba van, akkor azt szépen loggoljuk, elkapjuk, becsomagoljuk egy checked exception-be, és a kliensnek elmondjuk, hogy mi volt a hiba (pl. adatbázis constraint, ConcurrentModification, stb.). Erre szerencsére nekünk van egy facade beanünk, ahol minden hívás átmegy, ott egy catch blokkban ezt pompásan mind megtehetnénk. De sajnos mire odaér a hiba, már csak egy EJBException lesz a kezünkbe, ami a vicc kedvéért nem tartalmazza az eredeti exception-t (a speckó erre nem kötelezi a konténert).

Két dolgot csinálhatunk: egyrészt minden bean metódus végére berajku a fentebb vázolt catch-et, ahol a rendszer exception-t alkalmazás exception-ba csomagoljuk (AOP nélkül ez rengeteg redundás kódot jelent).

A második megoldás viszont azért létezik, mert fent egy kicsit pongyolán fogalmaztam. A rendszer exceptionök közé nem az összes runtime exception tartozik, csak az olyanok, amik nem alkalmazás exceptionok mégis. Megmondhatjuk ugyanis bármilyen runtime exception-re, hogy mégis alkalmazás exception-ként viselkedjen. Ehhez vagy annotálunk, vagy az ejb-jar.xml-ben definiáljuk ezeket az exceptionöket.

Nálunk pl. ez lett:
<pre lang="xml">


    
        
            oracle.toplink.essentials.exceptions.DatabaseException
            false
        
        
            javax.persistence.PersistenceException
            false
        
        
            java.lang.NullPointerException
            false
        
    

</pre>
Most már ezek az exception-ök is eljutnak a facade beanünkhöz, itt, egy helyen eldöntjük, hogy milyen checked exceptiont kap a kliens, amiben már benne tud lenni valami tipp is, hogy mi lehetett a probléma.
