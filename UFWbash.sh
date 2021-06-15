#!/bin/sh

# Start UFW $
#############
sudo ufw enable

# Uncomment below to reject all traffic #
#########################################
#sudo ufw default reject

# Most Suspect Ports & description    #
# Change "deny" to "allow" if needed  # 
#######################################
ufw deny 8  >/dev/null #Unassigned
ufw deny 7 >/dev/null #Echo
ufw deny 19 >/dev/null #Chargen
ufw deny 20 >/dev/null #FTP
ufw deny 21 >/dev/null #FTP
ufw deny 22 >/dev/null #ssh
ufw deny 23 >/dev/null #Telnet
ufw deny 24 >/dev/null #Priv-mail
ufw deny 25 >/dev/null #SMTP simple mail transfer protocol
ufw deny 53 >/dev/null #DNS
ufw deny 69 >/dev/null #TFTP - Trivial File Transfer Protocol 
ufw deny 79 >/dev/null #Finger Protocol
ufw deny 110 >/dev/null #POP3
ufw deny 111 >/dev/null #ONC RPC (SunRPC)
ufw deny 135 >/dev/null #RPC/DCE microsoft net
ufw deny 137 >/dev/null #Netbios over TCP/IP 137-445
ufw deny 138 >/dev/null #netbios-ssn
ufw deny 139 >/dev/null #netbios-ssn
ufw deny 143 >/dev/null #IMAP
ufw deny 161 >/dev/null #SNMP
ufw deny 162 >/dev/null #SNMP traps outgoing
ufw deny 389 >/dev/null #LDAP Server
ufw deny 443 >/dev/null #HTTPS
ufw deny 445 >/dev/null #netbios-ssn  SMB
ufw deny 500 >/dev/null #IKEv2 IPsec ISAKMP
ufw deny 512 >/dev/null #Berkeley rexec,
ufw deny 513 >/dev/null #rlogin
ufw deny 514 >/dev/null #rcp rsh
ufw deny 515 >/dev/null #LPD TCP/IP Print Server
ufw deny 554 >/dev/null #Windows Media Services
ufw deny 993 >/dev/null #IMAPS
ufw deny 995 >/dev/null #POP3S
ufw deny 1433 >/dev/null #Microsoft SQL server
ufw deny 1434 >/dev/null #Microsoft SQL monitor
ufw deny 1701 >/dev/null #L2TP
ufw deny 1723 >/dev/null #PPTP
ufw deny 3306 >/dev/null #MYSQL
ufw deny 3389 >/dev/null #Windows Terminal Server
ufw deny 4500 >/dev/null #local sercurity authority
ufw deny 5357 >/dev/null #Microsoft HTTPAPI
ufw deny 5900 >/dev/null #VNC
ufw deny 5985 >/dev/null #HTTP WinRM 2.0
ufw deny 5986 >/dev/null #HTTPS WinRM 2.0
ufw deny 6600 >/dev/null #Live Migration Hyper-V 
ufw deny 42424 >/dev/null #ASP.NET State Service
ufw deny 51515 >/dev/null #Microsoft Operations Manager 2000

# Display rules & restart to take effect #
##########################################
systemctl restart ufw
ufw status numbered
