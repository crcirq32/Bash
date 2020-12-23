#!/bin/sh

# Create the connection  #
# "echo $?" = checkpoint #
##########################

echo "Connection Name"
read name

echo "SSID Name"
read ssid 

# "ip a" display network name #
###############################

#ip a
echo "WF name"
read wifi

echo "Password for WF"
read pw

#Display location wifi #
########################

#nmcli dev wifi

# Create Wifi connection #
##############################

#nmcli c add type wifi con-name ${name} ifname ${wifi} ssid ${ssid}
#echo $?

# Modify connect to add WPA-password #
######################################

#nmcli con modify ${name} wifi-sec.key-mgmt wpa-psk
#echo $?

# Create the location for password file #
#########################################

#touch 802-11-wireless-security.psk /tmp/802-11-wireless-security.psk
#chmod 755 /tmp/802-11-wireless-security.psk
#echo "802-11-wireless-security.psk:${pw}" >/tmp/password.txt

# locate the password file #
############################

#nmcli --ask con modify ${name} wifi-sec.psk ${pw} 
#echo $?

# Turn the connection on #
##########################

#nmcli con up ${name} 
