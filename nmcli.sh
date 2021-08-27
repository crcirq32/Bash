#!/bin/sh

# Create connection   #
#######################

#echo "Connection Name"
#read name

#echo "SSID Name"
#read ssid 

# "ip a" display network name #
#     Get connection info     #
###############################

#ip a
#echo "WF name"
#read wifi

#echo "Password for WF"
#read pw

# Display location wifi #
########################
#nmcli dev wifi

# Create Wifi connection #
##########################

#nmcli c add type wifi con-name ${name} ifname ${wifi} ssid ${ssid}
#echo $?

# Modify connect to add WPA-password #
######################################

#nmcli con modify ${name} wifi-sec.key-mgmt wpa-psk
#echo $?

# add password  #
#################

#nmcli --ask con modify ${name} wifi-sec.psk ${pw} 
#echo $?

# Turn the connection on #
##########################

#nmcli con up ${name} 
