---
date: '2010-12-07 16:53:09'
layout: post
slug: using-amazon-s3-as-a-maven-repository
status: publish
title: Using Amazon S3 as a Maven repository
wordpress_id: '27'
tags:
- amazon
- aws
- deploy
- maven
- repository
- s3
---

Amazon S3 is a quite cheap hosting solution. You can use it as a maven repository with an appropriate wagon provider. There are many implementation but some of them out of date or not available over the central maven repo. I am using the

    
    
    org.springframework.build.aws:org.springframework.build.aws.maven 
    


from the central.

To use S3 as a maven repository follow the steps below:

1. Add the spring aws artifact as an extension to the project pom.xml.


    
    
      <build>
            <extensions>
                <extension>
                    <groupid>org.springframework.build.aws</groupid>
                    <artifactid>org.springframework.build.aws.maven</artifactid>
                    <version>3.0.0.RELEASE</version>
                </extension>
            </extensions>
        </build>
    



Note: There is a newer version of the artifact in the spring git repository (git://git.springsource.org/spring-build/aws-maven.git) but I isn't deployed to the central. But in the version 3.1 only the version of jet3t dependency is changed.

2. Create a public bucket on Amazon S3. You can do it easily over the [AWS web console](https://console.aws.amazon.com/s3/home)
.
3. Add a distribution management element to the pom.xml


    
    
       <distributionmanagement>
            <repository>
                <id>anzix-maven</id>
                <name>Anzix.NET s3 repository</name>
                <url>s3://anzixmaven/release</url>
            </repository>
        </distributionmanagement>
    



Use your bucket name only after the s3:// prefix.

Note: With the current version of the provider you should use a prefix after your bucket name (such like the release).

4. Add your credentials (available from [http://aws.amazon.com/account/](http://aws.amazon.com/account/): Security Credentials to a new server element in your ~/.m2/settings.xml


    
    
       <servers>
           <server>
                <id>anzix-maven</id>
                <username>Access Key</username>
                <passphrase>Secret Access Key</passphrase>
            </server>
       </servers>
    



**IMPORTANT**: If you are using maven 3 or newer you should encrypt the passhrase unless it won't be work. See [this](http://maven.apache.org/guides/mini/guide-encryption.html) howto.

5. Test it.


    
    
    mvn deploy
    
    
    
    
    6. You don't need the extension element if you would like only to use your uploaded artifacts.
    
    
    
    
    <repositories>
            <repository>
                <id>s3repo</id>
                <name>Anzix s3 repository</name>
                <url>https://anzixmaven.s3.amazonaws.com/release2</url>
            </repository>
        </repositories>
    



PS: There are also an improved implementation [here](https://test.kuali.org/svn/student/deploymentlab/trunk/kuali-wagon-s3/) but without any license notes.
