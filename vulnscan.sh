#!/bin/bash

#DL scripts #
#############
#git clone https://github.com/scipag/vulscan scipag_vulscan

#ln script #
############
#ln -s `pwd`/scipag_vulscan /usr/share/nmap/scripts/vulscan

echo "[+] Which IP?"
echo "[+] Syntax: 10.10.X.Y"
echo "[+] output file: ./CVEs.txt"
read IP

nmap -sV -oN CVEs.txt --script=vulscan/vulscan.nse ${IP}
