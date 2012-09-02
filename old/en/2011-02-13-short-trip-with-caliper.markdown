---
date: '2011-02-13 21:17:54'
layout: post
slug: short-trip-with-caliper
status: publish
title: Short trip with caliper
wordpress_id: '53'
tags:
- calipre
- microbenchmark
- pilpul
---

**1. **Yesterday one of my colleague  asked the classic question from us:

Which one is the faster:

    
    for(int i = 100000; i > 0; i--) {
       //do something
    }


or

    
    for(int i = 1; i < 100001; i++) {
       //do something
    }


I haven't known this question before but It seemed a good time to try google's microbanchmark framework [caliper](http://code.google.com/p/caliper/). It worked well. And I can't measure any significat difference between the two method:

[![](http://blog.anzix.net/files/2011/02/caliper.png)](http://microbenchmarks.appspot.com/run/einstand@gmail.com/examples.LoopingBackwardsBenchmark)

And finally I found a good  [thread](http://stackoverflow.com/questions/1656506/which-of-these-pieces-of-code-is-faster-in-java) on stackoverflow about it and some reason why the question is not trivial (and probably not meaningful).

We can ideas about how the JVM should work but we can't be sure about anything.  (I think in most cases we also should have doubt  about how exact or microframework measurements. Or at least think twice...)

**2. **There was also an other argue at the lunch about how slow is volatile access . Unfortunately it's very hard to measure it with a classical microbenchmark framework. I need to reproduce a situation when two thread of one JVM are manipulating the same volatile variable from to separetad core or cpu. I don't now how will I do it. (There is also an another good stackoverflow [thread](http://stackoverflow.com/questions/4633866/is-volatile-expensive) about the main problems.)
