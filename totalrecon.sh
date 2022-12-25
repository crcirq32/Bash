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
line={
nmappp=(nmap -sC -sV -n -T4 -oN /tmp/main.$targetip.txt ${targetip})
nmapu=(nmap -su -T4 -oN /tmp/udp.$textip.txt ${targetip})

#begin the grep
grep21=(grep "21/tcp /tmp/$targettip.txt")
grep53=(grep "53/tcp /tmp/$targettip.txt")
grep3306=(grep "3306/tcp /tmp/$targettip.txt")

#port 80
dirbust=(gobuster --url http://$ip --wordlist=/usr/share/wordlists/Seclist/DNS/Discovery/ &)
feroxrust=(feroxbuster --url http://$ip --wordlist=/usr/share/wordlists/Seclist/DNS/Discovery/ &)
godust=(gobuster --url http://$ip --wordlist=/usr/share/wordlists/Seclist/DNS/Discovery/ &)
fuffyfuf=(ffuf -u http://$targetip.htb/FUZZ -w /usr/share/wordlists/SecLists/Discovery/Web-Content/raft-large-words-lowercase.txt | grep "Status: 200\|Status: 301")

#port 3306
mysqqql=(mysql -u root -p -h $targetip 2>/dev/null >> /tmp/mysql.$iptarget.ip.txt)

}
while i in line = read ${line}; do

if [$(nmapeight) -e 0]; 
        then
                ${dirbust} >> /tmp/dir.$targetip.txt &
                ${feroxbuster} >> /tmp/dir.$targetip.txt &
                ${gobuster} >> /tmp/dir.$targetip.txt &
                ${fuffyfuf} >> /tmp/dir.$targetip.txt &
fi

if [$(grep21) -e 0]; 
        then
        ftp $ip >> /tmp/ftp.$targetip.txt
fi

if [$(grep53) -e 0]; 
        then
        nslookup $ip >> /tmp/nsup.$targetip.txt &
        dnsrecon $ip >> /tmp/nsup.$targetip.txt &
        nslookup $ip >> /tmp/nsup.$targetip.txt &
        nslookup $ip >> /tmp/nsup.$targetip.txt &
fi

if [$(grep3306) -e 0]; 
        then
                ${mysqqql}
fi
echo $?

#Open output to view
vim -p /tmp/*$iptarget.txt
echo $?

#cleanup
rm -rf /tmp/${Today}.* /tmp/port80.txt
#echo $?
