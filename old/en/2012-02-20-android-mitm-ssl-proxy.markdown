---
layout: post
title: "Check Android application communication with mitm proxy"
category: 
tags: [android proxy mitm]
---

I started to create a simple solution to check the network usage of my android phone. My basic idea was to create a transparent mitm proxy
and capture all of the network messages. The proxy is created but still I can't find a greate transparent ssl capable mitm proxy.

FTR the basic steps were:

install [mitmproxy](http://mitmproxy.org/)
------------------------------------------

Python, pip, etc.


Transparent route to the proxy
------------------------------

I have an openwrt on my wlan router and the transparent proxy creation is well [documented](http://wiki.openwrt.org/doc/uci/firewall)


    config 'redirect'                      
        option 'src' 'lan'             
        option 'proto' 'tcp'           
        option 'src_ip' '192.168.0.237'
        option 'dest_ip' '192.168.0.80'
        option 'dest_port' '4444'      
        option 'target' 'DNAT'            
                                       
    config 'redirect'                      
        option 'dest' 'lan'            
        option 'proto' 'tcp'                      
        option 'src_dip' '192.168.0.1'   
        option 'dest_ip' '192.168.0.80' 
        option 'dest_port' '4444'    
        option 'target' 'SNAT' 

        
It's in the /etc/firewall package and I needed an uci commit and firewall restart to activate the rules.

Install mitm CA to the android
------------------------------

After some googling I found [this](http://wiki.cacert.org/FAQ/ImportRootCert?action=show&redirect=ImportRootCert#Android_Phones) the best one.

    adb pull /system/etc/security/cacerts.bks cacerts.bks

    keytool -keystore cacerts.bks -storetype BKS -provider org.bouncycastle.jce.provider.BouncyCastleProvider -storepass changeit -importcert -trustcacerts -alias proxy -file mitmproxy-ca-cert.pem

    keytool -keystore cacerts.bks -storetype BKS -provider org.bouncycastle.jce.provider.BouncyCastleProvider -storepass changeit -v -list | grep proxy

    adb pull /system/etc/security/cacerts.bks cacerts.bks
    


Current status: It works very well but only with the http traffic. As I found the mitmproxy [works only as an explicit proxy](http://groups.google.com/group/mitmproxy/browse_thread/thread/642270e13c1c2569?pli=1) not as a transparent.