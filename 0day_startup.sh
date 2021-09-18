#!/bin/bash
#Rewrite of https://0xboku.com/2021/09/14/0dayappsecBeginnerGuide.html

#make directory for app
mkdir libraryApp && cd libraryApp/       

#find corresponding app
curl -o librarymanagement.zip https://www.sourcecodester.com/sites/default/files/download/oretnom23/librarymanagement.zip    

#unzip app
unzip librarymanagement.zip  

#remove current server
sudo rm -r /var/www/html/*

#move new app to server location
sudo mv LibraryManagement/ /var/www/html/

#start mysql db
sudo systemctl start mysql.service

# login to the MySQL service using as root user or by using sudo.
# The default username password for a fresh MySQL 
#   service on kali is user 'root' with password as nothing (blank)
sudo mysql -u root

# mysql cmds:
# > CREATE DATABASE library_db;
# > show databases;

#copy sql into mysql db
cd /var/www/html/LibraryManagement/
sudo mysql -u root -p library_db < library_db.sql
#login to mysql
sudo mysql -u root

# mysql cmds:
# > show databases;
# > use library_db;
# > show tables;

#start apache server
sudo systemctl start apache2.service

#Windows case sensitivity changed for linux:
#This photo contains images
sudo mv /LibraryManagement/Ify /LibraryManagement/ify

#download VScode - for debugginag https://code.visualstudio.com/
#Vim extension: http://www.sromero.org/wiki/linux/servicios/php/vim_debug_basics
cd ~/Downloads/
dpkg -i code_1.60.1-1631294805_amd64.deb

#VScode cmds:
#select "Extensions" && search for "PHP Debug"
#Select "Explorer" tab && then "Open Folder" && then "var/www/html/LibraryManagement/"

#Launch.json file creation:
#VSCode cmd:
# "Explorer" -> "index.php" -> "Run and Debug" -> "create a launch.json file hyperlink"

#If issue with launch.json creation:
#sudo chmod -R kali:kali /var/www/html/

#Default JSON config file:
#Port 9003 default for XDebug (Ver:3.X)

#{
#    // Use IntelliSense to learn about possible attributes.
#    // Hover to view descriptions of existing attributes.
#    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
#    "version": "0.2.0",
#    "configurations": [
#        {
#            "name": "Listen for Xdebug",
#            "type": "php",
#            "request": "launch",
#            "port": 9003
#        },
#        {
#            "name": "Launch currently open script",
#            "type": "php",
#            "request": "launch",
#            "program": "${file}",
#            "cwd": "${fileDirname}",
#            "port": 0,
#            "runtimeArgs": [
#                "-dxdebug.start_with_request=yes"
#            ],
#            "env": {
#                "XDEBUG_MODE": "debug,develop",
#                "XDEBUG_CONFIG": "client_port=${port}"
#            }
#        },
#        {
#            "name": "Launch Built-in web server",
#            "type": "php",
#            "request": "launch",
#            "runtimeArgs": [
#                "-dxdebug.mode=debug",
#                "-dxdebug.start_with_request=yes",
#                "-S",
#                "localhost:0"
#            ],
#            "program": "",
#            "cwd": "${workspaceRoot}",
#            "port": 9003,
#            "serverReadyAction": {
#                "pattern": "Development Server \\(http://localhost:([0-9]+)\\) started",
#                "uriFormat": "http://localhost:%s",
#                "action": "openExternally"
#            }
#        }
#    ]
#}

#Install Xdebug on Kali:
#sudo apt install php-xdebug -y

#navigate to Php config file for Apache:
#cd /etc/php/7.4/apache2

#Add following to bottom of php.ini
#sudo printf '[xdebug]\nxdebug.mode = debug\nxdebug.start_with_request = yes\nxdebug.idekey = VSCODE\nxdebug.client_port = 9003\nxdebug.client_host = "127.0.0.1"\nxdebug.discover_client_host  = 1\nxdebug.log="/tmp/xdebug.log"\nxdebug.cli_color = 1OA\n' >> php.ini

#if does not allow:
#sudo chmod 777 php.ini

#restart apache
#sudo systemctl restart apache2.service
