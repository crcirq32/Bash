#!/bin/bash

echo "What IP address?"
read IP

echo "\n Info: \n"
curl -s http://ipinfo.io/$IP
