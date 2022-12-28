#!/bin/bash

#I can't promise this works, steps are there though. :)
#steps from https://www.cyberithub.com/how-to-install-qemu-on-ubuntu-20-04-lts-focal-fossa/
#https://www.qemu.org/

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

#convert to .qcow2
#qemu-img convert <img.iso> <img_name.qcow2

#encrypt image: similiar to LUKS
encrypt.format <img.qcow2> 

#run qemu:
