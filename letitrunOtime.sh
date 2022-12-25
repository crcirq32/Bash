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
read wauser

#Create list to run through all these on loop to check if they are running. array of exe variables?
nmappp=(nmap -sC -sV -n -T4 -oN /tmp/main.$targetip.txt ${targetip})
nmapeight=(nmap /tmp/80map.$targetip.txt ${targetip})
nmapu=(nmap -su -T4 -oN /tmp/udp.$textip.txt ${targetip})
finpid=(echo $$)
chill=(wait $finpid)

do I add a recursive file? lol @ /tmp/. programming should be easier.


#begin the grep
grep21=(grep "21/tcp /tmp/$targettip.txt")
grep53=(grep "53/tcp /tmp/$targettip.txt")
grep3306=(grep "3306/tcp /tmp/$targettip.txt")
grep80=(grep "80/tcp /tmp/$targettip.txt")

#port 80
grep80=(while true; do read ${listof80};

line=(
dirbust=(gobuster --url http://$targetip --wordlist=/usr/share/wordlists/Seclist/DNS/Discovery/; $finpid &)
feroxrust=(feroxbuster --url http://$targetip --wordlist=/usr/share/wordlists/Seclist/DNS/Discovery/; $finpid &)
godust=(gobuster --url http://$targetip --wordlist=/usr/share/wordlists/Seclist/DNS/Discovery/; $finpid &)
fuffyfuf=(ffuf -u http://$targetip.htb/FUZZ -w /usr/share/wordlists/SecLists/Discovery/Web-Content/raft-large-words-lowercase.txt; $finpid & | grep "Status: 200" \| "Status: 301")
)
#port 3306
mysqqql=(mysql -u $wauser -p -h $targetip 2>/dev/null >> /tmp/mysql.$targetiptarget.ip.txt)

while i in line = [${line} e 0]; do
if [$(nmapeight) -e 0]; 
        then
          ${dirbust} >> /tmp/dir.$targetip.txt &${finpid} 
          ${chill} 
          ${feroxbuster} >> /tmp/dir.$targetip.txt ${finpid} &
          ${chill} 
          ${gobuster} >> /tmp/dir.$targetip.txt ${finpid} &
          ${chill} 
          ${fuffyfuf} >> /tmp/dir.$targetip.txt ${finpid} & 
          ${chill} 
fi
if [$(nmap) -e 0]; 
        then
          ${dirbust} >> /tmp/dir.$targetip.txt &
          ${chill} 
          ${feroxbuster} >> /tmp/dir.$targetip.txt &
          ${chill} 
          ${gobuster} >> /tmp/dir.$targetip.txt &
          ${chill} 
          
if [$(grep21) -e 0]; 
        then
        ftp $targetip >> /tmp/ftp.$targetip.txt
         ${chill}
fi

if [$(grep53) -e 0]; 
        then
        nslookup $targetip >> /tmp/nsup.$targetip.txt &
         ${chill}
        dnsrecon $targetip >> /tmp/nsup.$targetip.txt &
         ${chill}
        dig version.bind CHAOS TXT >> $targetip.txt &
         ${chill)
        dig axfr $targetip >> $targetip.txt &
         ${chill}
fi

if [$(grep3306) -e 0]; 
        then
                ${mysqqql}
fi
                                   
