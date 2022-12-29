#!/bin/bash

#I can't promise this works, steps are there though. :)
#steps from https://www.cyberithub.com/how-to-install-qemu-on-ubuntu-20-04-lts-focal-fossa/
#https://www.qemu.org/
#https://purplepalmdash.github.io/2013/12/12/kali-linux-in-qemu/
#linux tips:: https://purplepalmdash.github.io/categories/linuxtips/
#https://www.knowdef.com/post/install-qemu-on-ubuntu-20.04/
#VIM spell check ": set spell spelllang=en_us"

#update
#sudo apt-get update -y && sudo apt-get upgrade -y

#add deps
#sudo apt install libpixman-1-dev libcairo2-dev libpango1.0-dev libjpeg8-dev libgif-dev ninja-build flex bison gcc g++ git make

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

#run qemu:
#qemu-system-x86_64 -hda ~/Documents/kali-2022.qcow2 --enable-kvm -boot d -cdrom ./kali-linux-2022.4-live-amd64.iso -m 2048 -smp 2

#setting up network in qemu
#https://ahelpme.com/linux/howto-do-qemu-full-virtualization-with-bridged-networking/

#TODO:
#encrypt image: similiar to LUKS
#encrypt.format <img.qcow2> 
#Kern testing!
#https://www.qemu.org/docs/master/system/linuxboot.html
# look into --sandbox

#Alternative: https://hub.docker.com/u/kalilinux/
