#!/bin/bash

#Mkdir and cd
sudo mkdir -p ~/Desktop/notebook && sudo chmod 777 ~/Desktop/notebook && cd ~/Desktop/notebook 

#update
sudo apt-get update -y && sudo apt-get -y upgrade &

sleep 10

#install deps
sudo apt-get install python3-pip python3-dev -y && -H pip3 install --upgrade pip -y \
&& -H pip3 install virtualenv \

#start py env
&& virtualenv jupyterenv && source jupyterenv/bin/activate && \

#add pip libs to py env
pip install numpy matplotlib jupyter scipy requests graphviz

echo $?
sleep 15

#start notebook
jupyter notebook --ip="127.0.0.1" --port=8888
