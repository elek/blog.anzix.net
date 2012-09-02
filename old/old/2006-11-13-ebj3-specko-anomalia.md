---
layout: post
title: EBJ3 speckó anomália
tags: []
status: publish
type: post
published: true
---
Kedves esti olvasmányom (core változat
[innen](http://jcp.org/aboutJava/communityprocess/final/jsr220/index.html)).

  
Hanem valaki igazán megmondhatná, hogy hogyan kell ezt a két mondatot egymás
mellett értemezni:
  
> "Note that a container can also invoke the PreDestroy method on the instance
> without a client call to remove the session object after the lifetime of the
> EJB object has expired. " *(4.4 page 76 utsó bekezdés közepe-vége)*

  
> "The following scenarios result in the PreDestroy lifecycle callback
> interceptor method(s) not being called for an instance:
>  
> \[...\]
>
> A timeout of client inactivity while the instance is in the passive state. The timeout is speciﬁed by the Deployer in an EJB container 
> implementation-speciﬁc way." *(4.4.3 page 81 alja - 82 teteje)*

  
Most hogy nagyon töröm a fejem, esetleg arra gondolna, hogy method ready
állapotból PreDestroy-jal timeout-tol, passive-ból meg anélkül? De azt azért
ennél egyértelműbben is meg lehetne fogalmazni. Talán egy következő fejezetből
kiderül. Ötlet?

