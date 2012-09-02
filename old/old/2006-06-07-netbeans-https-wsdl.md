---
layout: post
title: Netbeans + https + WSDL
tags: []
status: publish
type: post
published: true
---
Xfire-t félretéve kínomban Netbeans-szel próbálkoztam. Nagyon kellemes
meglepetés, mert nagyon jó Webservices támogatása van. New web service client
és ott megadom a WSDL url-jét, és ő mindent legenerál. A kódban a a megfelelő
helyen pedig jobb klikk és oda passzintja a lekérdező kódot. Tiszta hedon.

Persze ha ilyen jól megy minden kipróbáltam HTTPS-sel is. A WSDL beolvasáskor
azonban elszállt csúnyán valami ilyesmivel:

> java.rmi.RemoteException: HTTP transport error:
javax.net.ssl.SSLHandshakeException:
sun.security.validator.ValidatorException: PKIX path building failed:
sun.security.provider.certpath.SunCertPathBuilderException: unable to find
valid certification path to requested target; nested exception is:

Kis guglizás után kiderült, hogy a generált tomcat ssl tanúsítványt be kell
importálni megbízhatóként egy keystore-ba, és azt megadni neki paraméterként.
Netbeans eképpen indítva valahogy így:


    cd /home/... keytool -genkey -alias tomcat -keyalg rsa keytool -export -alias tomcat -rfc -file tomcat.cer keytool -import -alias tomcat -file tomcat.cer -keystore truststore ./bin/netbeans -J-Djavax.net.ssl.trustStore=/home/.../truststore -J-Djavax.net.ssl.trustStorePassword=changeit

Persze utána a programot is ilyen JVM paraméterekkel kell indítani

    -Djavax.net.ssl.trustStore=/home/...truststore -Djavax.net.ssl.trustStorePassword=changeit

Ezek után a végén még a xfire is működni fog.

