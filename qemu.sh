#!/bin/bash

#I can't promise this works, steps are there though. :)
#steps from https://www.cyberithub.com/how-to-install-qemu-on-ubuntu-20-04-lts-focal-fossa/
#https://www.qemu.org/
#https://purplepalmdash.github.io/2013/12/12/kali-linux-in-qemu/
# lotta cooooooo linux tips:: https://purplepalmdash.github.io/categories/linuxtips/
#: set spell spelllang=en_us

#update
#sudo apt-get update -y && sudo apt-get upgrade -y

#add deps
#sudo apt install libpixman-1-dev libcairo2-dev libpango1.0-dev libjpeg8-dev libgif-dev ninja-build meson flex bison gcc g++ git 

#dont use apt-get. install from source.
#git clone https://gitlab.com/qemu-project/qemu.git
#cd qemu
#git submodule init
#git submodule update --recursive
#./configure
#make #gonna take a whileeeeee
#make install 

#install your fav .iso

#create .img spaceholder:
#qemu-img create -f qcow2 kali.qcow2 30G

#convert to .qcow2
#qemu-img convert <img.iso> <img_name.qcow2

#encrypt image: similiar to LUKS
#encrypt.format <img.qcow2> 

#run qemu:
#./run-qemu -hda ./kali.qcow2 -boot d -cdrom /media/nfs/iso/kali-linux-1.0.5-i386.iso  -m 1024 -enable-kvm -usb

#Kern testing!
#https://www.qemu.org/docs/master/system/linuxboot.html

# look into --sandbox

#Alternative: https://hub.docker.com/u/kalilinux/
