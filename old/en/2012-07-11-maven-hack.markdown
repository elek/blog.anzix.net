---
title: Maven hack
layout: post
tags:
- maven
---

I can't say how I hated the Weblogic because it used **relative** classpath references in the MANIFEST.MF of some libraries. It was a big pain to upload the required dependencies to a maven repositoriy as it was quite hard to find all of the referenced jar files.

But now I started to use the same approach just because it was the easiest way to distribute a stanaldone test application and upgrade it frequently.


For example, my test client could contain this one:


       <plugin>
            <artifactId>maven-jar-plugin</artifactId>
            <version>2.3.1</version>
            <executions>
               <execution>
                  <id>default-jar</id>
                  <phase>package</phase>
                  <goals>
                     <goal>jar</goal>
                  </goals>
                  <configuration>
                     <useDefaultManifestFile>true</useDefaultManifestFile>
                     <archive>
                        <addMavenDescriptor>false</addMavenDescriptor>
                        <manifest>
                           <addClasspath>true</addClasspath>
                           <mainClass>net.anzix.rocket.Start</mainClass>
                           <classpathLayoutType>custom</classpathLayoutType>
                           <customClasspathLayout>../../../../../${artifact.groupIdPath}/${artifact.artifactId}/${artifact.baseVersion}/${artifact.artifactId}-${artifact.baseVersion}${dashClassifier?}.${artifact.extension}</customClasspathLayout>
                        </manifest>
                     </archive>
                  </configuration>
               </execution>
            </executions>
         </plugin>



After a *mvn deploy* we can upgrade the client jar files at any time at any location with:

    mvn org.apache.maven.plugins:maven-dependency-plugin:2.4:get -Dartifact=net.anzix:atom:1.0-SNAPSHOT -U


And now we can start the app directly from the M2 repo.

    java -jar $M2_REPO/net/anzix/atom/1.0-SNAPSHOT/atom-1.0-SNAPSHOT.jar ...

The only problem is that I don't know any effective method to get the M2_REPO value without setting it manually *in Windows*. (On linux I can do it with mvn help:evaluate and some grep/sed magic).

PS: Yes, I know, there is the WebStart, but it's much more lightweight, and such way I can use the jar files directly from the maven repo.




