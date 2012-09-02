---
date: '2011-01-17 21:42:49'
layout: post
slug: ardor3d-or-jmonkeyengine-3
status: publish
title: Ardor3d or JMonkeyEngine 3?
wordpress_id: '41'
tags:
- opengl
- project
---

One of my friends had a hobby project: creating a 3d [orienteering](http://en.wikipedia.org/wiki/Orienteering) game. (It's like an FPS but you should find check points on a terrain).

They have  an old windows version which one unfortunately lost. The current plan is rewriting the game in Java with additional functionality (multiplayer support, campaigns, etc.). Even I'm not experienced in 3D game programming and OpenGL I joined to him. It seems to be quite fun to learn something new which is totally different from what I do ususally.

Currently we have a prototype in JMonkeyEngine and we started to port it to ardord3d.  Some random thoughts about the two engine (as I wrote I am not an exprienced 3D programmer, just how I see ):



	
  * JMonkeyEngine is very alpha now. The terrain part is quite rough.

	
  * JMonkeyEngine has much more utility classes and services (built in physics support, sky example, etc)

	
  * JMonkeyEngine 3 needs OpenGL 2.0, Ardord3d  not definitely but the terrain classes need SM 2.0.

	
  * Ardror3d  code structure is more cleaner

	
  * Ardor3d project structure is more cleaner, the artifacts is published in a maven repository


So currently we are planning to use ardord3d.  Some task is much more harder in ardor3d but it's much more fun for me to learn some low level OpenGL things.

http://www.youtube.com/watch?v=nWRG5DWUe1I

PS: If you are interested in the project feel free to join the project [FurgeSzarvas](http://code.google.com/p/furgeszarvas/).
