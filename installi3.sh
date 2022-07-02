#https://kifarunix.com/install-and-setup-i3-windows-manager-on-ubuntu-20-04/

3apt update

apt show i3

apt install apt-transport-https --yes

#add key
#https://i3.baltorepo.com/i3/i3-autobuild-ubuntu/
curl https://baltocdn.com/i3-window-manager/signing.asc | sudo apt-key add -

#config sources.list
sudo apt-get install apt-transport-https --yes
echo "deb https://baltocdn.com/i3-window-manager/i3/i3-autobuild-ubuntu/ all main" | sudo tee /etc/apt/sources.list.d/i3-window-manager-i3-i3-autobuild-ubuntu.list
sudo apt-get update

apt install i3

#config file:
#vi ~/.config/i3/config
