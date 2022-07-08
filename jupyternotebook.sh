#!/bin/bash

#run as sudo
if [ $UID -ne 0 ]
then
  echo "Run as sudo."
  exit
fi

#install repo's
apt-get install python3-pip python3-dev && -H pip3 install --upgrade pip && -H pip3 install virtualenv && 

sleep 10

#Mkdir and cd
mkdir -p ~/Desktop/notebook && cd ~/Desktop/notebook

#Start env && activate env
virtualenv jupyterenv && source jupyterenv/bin/activate 

#install library's into env
pip install numpy matplotlib jupyter scipy requests graphviz sklearn pandas

sleep 10

#start notebook
jupyter notebook
