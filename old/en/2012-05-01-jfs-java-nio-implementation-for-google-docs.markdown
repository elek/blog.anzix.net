---
layout: post
title: "Java NIO FileSystemProvider for Google Drive"
category:
tags: [nio, google, drive, backup]
---

I started to use the java 7 NIO [FileSystem API](http://docs.oracle.com/javase/tutorial/essential/io/fileio.html).

My initial experience was quite good with the API but there are some very annoying limitations:

For example, why I can't do shomething like this: `FileSystems.getFileSystem("file::///tmp/asd");`?

It works with `file:///` but to get a file system I should use the root path so I must know how can I parse any kind of file path URI.

Or why the `path.resolve(path2)` can't work with pathes from two different providers? (Works with `path.resolve(path.toString())`

Finally I created a simple FileSystemProvider implementation which can save and read files to/from google docs. It's not a full implementation (yet)
but I started to use it to backup google drive folder to my local machine and backup local folders to google drive.

Project is on [github](https://github.com/elek/jfs).



