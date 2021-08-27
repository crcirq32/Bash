#!/bin/bash

# Check if script was run as root. Exit if false. #
###################################################
#if [ $UID -ne 0 ]
#then
#  echo "Please run this script with sudo."
#  exit
#fi

# Install ClamAV via apt-get #
##############################
#apt-get update
#add-apt-repository universe
#apt-get install clamav clamav-daemon
#clamscan --version

#Freshclam starts auto - reset it #
###################################
#sudo systemctl stop clamav-freshclam
#sudo freshclam

# Download the daily update #
#############################
#daily=$(wget https://database.clamav.net/daily.cvd -p /tmp/)
#touch /var/lib/clamav/daily.cvd
#cp ${daily} /var/lib/clamav/daily.cvd

# Start Freshclam # 
###################
#systemctl start clamav-freshclam

# When Freshclam is finished, make a directory #
# Create directory & move suspect files        #
# Start scanning directory "/"                 #
################################################

#mkdir /home/ubuntu/Desktop/Clamscan
#clamscan -r --move=/home/ubuntu/Desktop/Clamscan / &

