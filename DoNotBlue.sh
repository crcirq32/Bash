#!/bin/bash

#Do not run this
#Linux based
#Check logs:
#TODO: find exact entry
#LOTS TO DOOOOOO
#PRASE BASED OFF LOL!
#C scripts will always be 

#enum all additions:
#Grep ******** /var/log/* #find all changes in logs.

#make copy
cp ./DoNotBlue.sh $(directory)/.doit.sh

dirdir=(/tmp/.scan/)
grepauth=${grep "<login>" /var/log/auth.l0og}

#search ssh key

#Dmesg
sudo dmesg | grep "Unknown parameter \| IPv6 \| Invalid \| *ERROR* \| quiet \| ssh \| BIOS-* \| Hypervisor \| BOOT_IMAGE=*" > $(dirdir).dmesg.txt

#check kern additions.... lelz - way above you.


#kill process by user
ps aux | grep -v "root" > $(dirdir).proc.txt

#Check sticky bits
find / -perm 4000 2>/dev/null >> $(dirdir).stick.txt
find / -perm 6000 2>/dev/null >> $(dirdir).stick.txt
find / -perm 7000 2>/dev/null >> $(dirdir).stick.txt

#lock down dirs
chmod 600 /opt/*
chmod 600 /tmp/*
chmod 600 /home/${user}/* #weird look this up

#search tmp dir 
greptmp=${grep -f "{*.txt,*.jp,*.jpeg,,*.,*.cpp,*.c,*.sh,*.phar,*.php,*.pgp,} \| "}
grepopt=
grephome= 


#verify login above^
if {$grepauth -eq 0}; do


#verify weird logins^

#PAM, Fail2ban, firejail, netstat -nuplt? ps aux | grep "sh \| bash \| /bin/* \| /usr/bin/* \|"

#Add crontab
cp /tmp/.DoNotBlue.sh | tee -a /etc/crontab*

#yara rules?

#readexif

#strings

#search for time stamps
find . -type f -newermt $(date)

#setfacl --set=acl
#do something with ACL stuff.

