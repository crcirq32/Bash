#!/bin/bash

#Required Downloads:
#https://github.com/six2dez/reconftw
#https://github.com/OWASP/Nettacker.git

if [ $UID -ne 0 ]
then
  echo "Run as sudo."
  exit
fi

echo "Which domain?"
echo "Syntax [+] 192.168.X.Y"
read IP

Today=$(date +%d%m%Y)
#Search aggressively IP ports
nmap -A -T4 -sC -oN /tmp/${Today}.Nmap.${IP}.txt ${IP} &>/dev/null
echo $?

#Run reconftw.sh tool against IP
/home/Auxy/Desktop/reconftw/reconftw.sh -d ${IP} -r | tee /tmp/${Today}.${IP}.reconftw.txt
echo $?

#Nikto scan IP
nikto -h http://${IP} &>/dev/null > /tmp/${Today}.Nikto.${IP}.txt
echo $?

#TODO: fix modules:
##this scan module [x_powered_by_vul] not found! wappalyzer_scan etc etc
#Run nettacker agaisnt IP
python3 /home/${USER}/nettacker/nettacker.py -i ${IP} -m subdomain_scan,server_version_vuln -s & | tee /tmp/${Today}.Nettacker.${IP}.txt
echo $?
python3 nettacker.py --start-api #open @ 127.0.0.1:5000
echo $?

#TODO: Better IF statement for port 80
#run dirbuster on port 80
scanm=$(nmap -sS -p 80 -T4 ${IP} > /tmp/port80.txt)
dobuster=$(gobuster dir -q --url http://${IP} -w /usr/share/wordlists/dirbuster/directory-list-lowercase-2.3-medium.txt -t 50 > /tmp/${Today}.Gobuster.${IP}.txt)
${scanm}
if [ ${scanm} -e  0 ];
  then ${dobuster}
  exit
fi
echo $?

#Open output to view
vim -p /tmp/${Today}.*
echo $?

#cleanup
rm -rf /tmp/${Today}.* /tmp/port80.txt
#echo $?
