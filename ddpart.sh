#!/bin/bash

#Firstly, do not run this. 
#Secondly, here's what I'm trying to solve. 
sda                     8:0    0 111.8G  0 disk  
└─sda1                  8:1    0 111.8G  0 part  
sdb                     8:16   0   1.8T  0 disk  
├─sdb1                  8:17   0   512M  0 part  /boot/efi
├─sdb2                  8:18   0   732M  0 part  /boot
└─sdb3                  8:19   0   1.8T  0 part  
  └─sdb3_crypt        253:0    0   1.8T  0 crypt 
    ├─vgubuntu-root   253:1    0   1.8T  0 lvm   /
    └─vgubuntu-swap_1 253:2    0   976M  0 lvm   [SWAP]
    
#in current partition(s), zip to save space.
dd if=/dev/sdb* | bzip2 -9f >/tmp/current.img.bz2

#unzip

#Wants: create new partition with my current one. 1.8TB is huge...
dd if=current.img of=/dev/sda
