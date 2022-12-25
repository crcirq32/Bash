#!/bin/bash

#expected::
# git clone https://github.com/danielmiessler/SecLists.git -o /usr/share/wordlists/
#

#check sudo
if [ $UID -ne 0 ]
then
  echo "Run as sudo."
  exit
fi

#which ip?
echo -e "Domain? \n[+]Syntax:: "10.10.10.1""
read targetip 

#you got a user?
echo -e "what kind of user we working with? [+]Syntax:: johnathan"
read wauser

#you got a password?
echo -e "what kind of password we working with? [+]Syntax:: heavysecurity101"
read wapass

mkdir -p /tmp/scan/
locale=(/tmp/scan/)

#Create list to run through all these on loop to check if they are running. array of exe variables?
nmappp=(nmap -sC -sV -n -T4 -oN ${locale}.main ${targetip})
nmapeight=(nmap --script http-* -oN ${locale}.80map ${targetip})
nmapu=(nmap -sU -T4 -oN ${locale}.udp ${targetip})
finpid=(echo $$) # echo spawn pid
chill=(wait $finpid) # allow spawned pid to finish


TODO: Make it work. 

#begin the grep
grep21=(grep "21/tcp" ${locale}.ftp.txt)
grep53=(grep "53/tcp" ${locale}.${udp,dns}.txt)
grep3306=(grep "3306/tcp" ${locale}.mysql.txt)
grep80=(grep "80/tcp" ${locale}.80map.txt)

#port 80
enum80=(read line ; do echo ${line}; exe ${line})

line=(${dirbust}, ${feroxbuster},${gobuster},${chill},${fuffyfuf})
dirbust=(gobuster --url http://$targetip --wordlist=/usr/share/wordlists/Seclist/DNS/Discovery/; $finpid &)
feroxrust=(feroxbuster --url http://$targetip --wordlist=/usr/share/wordlists/Seclist/DNS/Discovery/; $finpid &)
godust=(gobuster --url http://$targetip --wordlist=/usr/share/wordlists/Seclist/DNS/Discovery/; $finpid &)
fuffyfuf=(ffuf -u http://$targetip.htb/FUZZ -w /usr/share/wordlists/SecLists/Discovery/Web-Content/raft-large-words-lowercase.txt; $finpid & | grep "Status: 200" \| "Status: 301"))
#port 3306
mysqqql=(mysql -u $wauser -p -h $targetip 2>/dev/null >> /tmp/mysql.$targetiptarget.ip.txt)

while read line [${line} e 0]; do
if [$(nmapeight) -e 0]; 
        then
          ${dirbust} >> ${locale}.dir ${finpid}  &
          ${chill} 
          ${feroxbuster} >> ${locale}.dir ${finpid} &
          ${chill} 
          ${gobuster} >> ${locale}.dir ${finpid} &
          ${chill} 
          ${fuffyfuf} >> ${locale}.dir ${finpid} & 
          ${chill} 
fi

if [$(grep21) -e 0]; 
        then
        ftp $targetip >> ${locale}.ftp
         ${chill}
fi

if [$(grep53) -e 0]; 
        then
        nslookup $targetip >> ${locale}.nsup &
        dnsrecon $targetip >> ${locale}.nsup &
        dig version.bind CHAOS TXT >> ${locale}.bindscan &
        dig axfr $targetip >> ${locale}.dig &
        ${chill}
fi

if [$(grep3306) -e 0]; 
        then
                ${mysqqql} >> ${locale}.mysql
fi
                                  
