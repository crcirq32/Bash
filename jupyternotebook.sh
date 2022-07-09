#!/bin/bash

#Mkdir and cd
sudo mkdir -p ~/Desktop/notebook && sudo chmod 777 ~/Desktop/notebook && cd ~/Desktop/notebook 

#update
sudo apt-get update && sudo apt-get -y upgrade &

sleep 10

sudo apt-get install python3-pip python3-dev && sudo -H pip3 install --upgrade pip \
&& sudo -H pip3 install virtualenv \
&& virtualenv jupyterenv && source jupyterenv/bin/activate && \
pip install numpy matplotlib jupyter scipy requests graphviz

echo $?
sleep 15

#start notebook
jupyter notebook --ip="127.0.0.1" --port=8888 --allow-root
