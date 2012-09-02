---
date: '2011-01-28 14:57:33'
layout: post
slug: maven-dependency-graph-generator-for-graphvizyed
status: publish
title: Maven dependency graph generator for graphviz/yed
wordpress_id: '45'
tags:
- graphiv
- graphml
- maven
- yed
---

Currently I am working on a very big maven project with dozens of submodules. I need a tool for visualizing the dependencies between the projects. I would like to create a raw file about the dependencies which can be customized in other graph rendering tool.

I found two useful tool  for creating graphs: [graphviz ](http://www.graphviz.org/)for the simple graphs and [yed](http://www.yworks.com/en/products_yed_about.html) for the complex ones.

Unfortunately I couldn't find an easy to use and simple maven plugin which can create a raw graph file based on the dependencies between maven projects. I found the [depgraph](http://el4j.sourceforge.net/plugins/maven-depgraph-plugin/index.html) plugin in el4j project but it can't work for me because it has too many dependencies from other el4j projects and probably from other repositories. I even can't build it from scratch probably some custom repository settings were missing.

So it seemed to be more fast to create an own maven plugin. Currently it's very simple (no scope/artifact filtering) and available from the [github](https://github.com/elek/depgraphviz) or the **central **maven repository (thanks for Sonatype).

Basic usage:

1. Add _net.anzix.maven_ to the _pluginGroups_ in your _settings.xml_:

    <plugingroups>
       <plugingroup>net.anzix.maven</plugingroup>
       <plugingroup>com.atlassian.maven.plugins</plugingroup>
    </plugingroups>
    
2. invoke the plugin with
    
    mvn depanal:graph
    
3. The result file will be found under target/dep

Some notable parameters:
	
  * **reactorOnly**: draw only the dependencies between the reactor projects and exclude the third-party dependencies
	
  * **format**: output format could be _dot_ (for graphviz) or _graphml _(for yed)

  * **showVersion, showGroupId**: these information could be excluded from the graph if you use the same groupId/version in all of your subproject.


