!#/bin/bash

#step process for VBox additions

#run as sudo
if [ $UID -ne 0 ]
then
  echo "Run as sudo."
  exit
fi

#always
apt-get update 

#wait some time.
sleep 1m

#install packages
apt-get install build-essential dkms linux-headers-$(uname -r) &

sleep 1min

#make mount point
mkdir -p /mnt/cdrom

#mount VBox additions to /mnt/cdrom
mount /dev/cdrom /mnt/cdrom

#navigate to directory
cd /mnt/cdrom

#run VBox additions.
./VBoxLinuxAdditions.run

#give time to install additions
sleep 2m

reboot
