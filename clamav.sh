#!/bin/bash

# Install ClamAV #
##################

#sudo apt-get update
#sudo add-apt-repository universe
#sudo apt-get install clamav clamav-daemon
#clamscan --version

#Freshclam is started automatically #
#####################################

#sudo systemctl stop clamav-freshclam
#sudo freshclam

# Download the daily update #
#############################

#daily=$(wget https://database.clamav.net/daily.cvd)
#touch /var/lib/clamav/daily.cvd
#sudo cp -rf ${daily} /var/lib/clamav/daily.cvd

# Start Freshclam # 
###################

#sudo systemctl start clamav-freshclam

# When Freshclam is finished, make a directory #
# Start the scanning directory "/"             #
# Create a directory to move suspect files     #
################################################

#sudo mkdir /home/ubuntu/Desktop/Clamscan
#sudo clamscan -r --move=/home/ubuntu/Desktop/Clamscan / &

