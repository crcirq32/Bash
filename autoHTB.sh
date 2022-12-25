#!/bin/bash

#check sudo
if [ $UID -ne 0 ]
then
  echo "Run as sudo."
  exit
fi

#which ip?
echo -e "Domain? \n[+]Syntax:: "10.10.10.1""
read targetip 

#var
#Create list to run through all these on loop to check if they are running. array of exe variables?
nmappp=(nmap -sC -sV -A -T3 -oN /tmp/$targetip.txt ${targetip})
nmapu=(nmap -su -T3 -oN /tmp/$textip.txt ${targetip})
nmapeight=(nmap -T4 -p 80 -oN /tmp/$targetip.txt ${targetip})

#port 80
dirbust=(gobuster --url http://$ip --wordlist=/usr/share/wordlists/Seclist/DNS/Discovery/)
feroxrust=(feroxbuster --url http://$ip --wordlist=/usr/share/wordlists/Seclist/DNS/Discovery/))
godust=(gobuster --url http://$ip --wordlist=/usr/share/wordlists/Seclist/DNS/Discovery/)

#port  



while i in line = true; do

if [$(nmapeight) -e 0]; 
        then
                ${dirbust} >> /tmp/dir.$targetip.txt &
                ${feroxbuster} >> /tmp/dir.$targetip.txt &
                ${gobuster} >> /tmp/dir.$targetip.txt &
fi

if [$(nmapeight) -e 0]; 
        then
                ${dirbust} >> /tmp/dir.$targetip.txt &
                ${feroxbuster} >> /tmp/dir.$targetip.txt &
                ${gobuster} >> /tmp/dir.$targetip.txt &
fi

if [$(nmapeight) -e 0]; 
        then
                ${dirbust} /tmp/dir.$targetip.txt &
                ${feroxbuster} /tmp/dir.$targetip.txt &
                ${gobuster} >> /tmp/dir.$targetip.txt &
fi

end

TODO: add on to portscan!!!!
