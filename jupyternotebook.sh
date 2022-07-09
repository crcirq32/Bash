#!/bin/bash

#Mkdir and cd
sudo mkdir -p ~/Desktop/notebook && cd ~/Desktop/notebook 

#update
sudo apt-get update && sudo apt-get -y upgrade &

echo $?
sleep 10

#install repo's
sudo apt-get install python3-pip python3-dev -y \
&& sudo -H pip3 install --upgrade pip \
&& sudo -H pip3 install virtualenv 

echo $?
sleep 10

#Start env && activate env
virtualenv jupyterenv && source jupyterenv/bin/activate 

#install library's into env
pip install numpy matplotlib jupyter scipy requests graphviz sklearn pandas

sleep 10

#start notebook
jupyter notebook --ip="127.0.0.1" --port=8888 --allow-root
