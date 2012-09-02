---
date: '2010-11-20 22:58:02'
layout: post
slug: amazon-ec2-archlinux-ext4
status: publish
title: Amazon EC2 + Archlinux + ext4
wordpress_id: '24'
tags:
- btrfs
- ec2
- ext4
---

Amazon EC2 offers a quite cheap instance type: micro instance with ~600Mbyte memory which is enough in most of the cases (I am using nginx, mysql, php-fpp, etc.). Certainly I am using a linux based instance but it wasn't sp simple to choose the distribution. There are a lot of startable bundle in the repository of AMIs, but for example Ubuntu images were quite bugg (for example it wasn't restartable) the Red Hat (?) based official images have too old packages, etc.

So I choosed the good old Archlinx distribution. Rolling release is great and some adrenaline is always needed for the every-day software update routine.

Unfortunately the available machine template has  Btrfs partitions. I tried the btrfs for one month and it was quite terrible (at least on EC2 environment). Once time I couldn't write any new file the the root partition. According to the disk usage reports I had 2 Gb (15%) free space. There is an [interesting conversation](http://www.mail-archive.com/linux-btrfs@vger.kernel.org/msg05130.html) about the problems of fragmentation on the mailing list. (It isn't calming). And I also have problems with unrar (sometimes it has froozen and a btrfs-* process has been eating my cpu time permanently) and php-fpm or munin (I am not sure but it seems they were very slow sometimes beacuse the IO layer).

So I modified the archlinux AMI creator scripts to using ext4 partition and I created new ext4 based images. You can find my version [here](https://github.com/elek/ec2build) (Just for the publishing, I don't think I will have time to  maintain it and thanks for the publication for the [original author](https://github.com/yejun).)

With the newly created ext3 based  server instance migrating the content from the old partition in the  fully virtualized environment isn't a complex  task. I had to create and drop a lot of volumes, snapshots, machine template and instances without dropping the live instances accidental.
