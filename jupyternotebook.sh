#!/bin/bash

#Mkdir and cd
sudo mkdir -p ~/Desktop/notebook && cd ~/Desktop/notebook 

#update
sudo apt-get update && sudo apt-get -y upgrade &

echo $?
sleep 10

#install repo's
sudo apt-get install python3-pip python3-dev -y
&& pip3 -H install --upgrade pip
&& pip3 -H install virtualenv 

echo $?
sleep 10

#Start env && activate env
virtualenv jupyterenv && source jupyterenv/bin/activate 

#install library's into env
pip3 install numpy matplotlib jupyter scipy graphviz sklearn pandas

sleep 10

#start notebook
jupyter notebook --ip="127.0.0.1" --port=8888 --allow-root
