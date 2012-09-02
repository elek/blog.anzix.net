---
date: '2010-10-20 20:02:51'
layout: post
slug: project-of-the-weekend-puploadr-py
status: publish
title: 'Project of the weekend: puploadr.py'
wordpress_id: '13'
categories:
- pow
tags:
- egg
- flickr
- maven
- python
---

I bought a flickr pro account so I would like to archive all of my old photos to flickr. First I used the uploadr.py script (specially a [forked version](http://github.com/ept/uploadr.py/network) from github). But it didn't work as I imagined.

So I wrote a new script ([puploadr](http://github.com/elek/puploadr)). It is much more simple (as I am not an advanced python programmer), for example it doesn't contains any flickr api, it uses the python flickrapi. It can cache both of the created photoset id and the id of the uploaded photos in every directory where image files are exists. So it can be run multiple times the upload will be resumed.

Technically it was the first time when I used the python setuptools.  It would be very interesting comparing it with maven, but I haven't enough time (and knowledge) to a full comparison.  Just some random thought:



	
  1. I prefer writing build logic and parameters in a programming language and not in XML. (This is one of the reasons why I like [gradle](http://www.gradle.org/) and [buildr](http://buildr.apache.org/)). Also see this [post](http://monkeyisland.pl/2008/12/11/build-systems-at-devoxx/) about build and it's _inherent scripting nature_

	
  2. There are two main conception about artifact distribution. You can distribute artifact with all of the dependencies (as most of the Java program do it) or distribute only the application and use the dependencies from a local repository (as Ruby and Python usually do it). It would be very interesting to create an experimental project in Java to implement the second method. I think the basic elements are given. We can create a standalone dependency resolver based on aether (eg. aether install foo:bar) and also we can create a special class loader (or just an application runner) which can load the classes from the local maven repository.

	
  3. The python setuptools also could create command shortcuts for the applications (eg. _/usr/bin/puploadr_). Very comfortable.

	
  4. [PyPI](http://pypi.python.org/pypi) is as awesome as simple. In Java word you can host your (open source) artifacts at Sonatype, but it's much more complicated (register to Jira, fill an issue, etc.) Here I registered to the PyPI and in the next step I could upload my artifact. Yes, I know, this is a decision between quality and freedom, but sometimes I prefer freedom over quality.

	
  5. PyPI is a full ecosystem without namespaces (groupId in Maven). And it seems to work well without it.


