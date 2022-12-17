#!/bin/bash

function autokill ()  {
clear
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[ON]${Font_color_suffix}"
Error="${Red_font_prefix}[OFF]${Font_color_suffix}"
cek=$(grep -c -E "^# Autokill" /etc/cron.d/tendang)
if [[ "$cek" = "1" ]]; then
sts="${Info}"
else
sts="${Error}"
fi 

function lima ()  {
echo -e ""
sleep 1
clear
echo > /etc/cron.d/tendang
echo "# Autokill" >/etc/cron.d/tendang
echo "*/5 * * * *  root /usr/bin/tendang $max" >>/etc/cron.d/tendang
echo -e ""
echo -e "======================================"
echo -e ""
echo -e "      Allowed MultiLogin : $max"
echo -e "      AutoKill Every     : 5 Minutes"      
echo -e ""
echo -e "======================================" 
service cron restart >/dev/null 2>&1
service cron reload >/dev/null 2>&1
read  -n 1 -s -r -p  "   Press any key to back on menu " 
autokill
}

function sepuluh ()  {
echo -e ""
sleep 1
clear
echo > /etc/cron.d/tendang
echo "# Autokill" >/etc/cron.d/tendang
echo "*/10 * * * *  root /usr/bin/tendang $max" >>/etc/cron.d/tendang
echo -e ""
echo -e "======================================"
echo -e ""
echo -e "      Allowed MultiLogin : $max"
echo -e "      AutoKill Every     : 10 Minutes"
echo -e ""
echo -e "======================================"
service cron restart >/dev/null 2>&1
service cron reload >/dev/null 2>&1
read  -n 1 -s -r -p  "   Press any key to back on menu " 
autokill
}

function limabelas ()  {
echo -e ""
sleep 1
clear
echo > /etc/cron.d/tendang
echo "# Autokill" >/etc/cron.d/tendang
echo "*/15 * * * *  root /usr/bin/tendang $max" >>/etc/cron.d/tendang
echo -e ""
echo -e "======================================"
echo -e ""
echo -e "      Allowed MultiLogin : $max"
echo -e "      AutoKill Every     : 15 Minutes"
echo -e ""
echo -e "======================================"
service cron restart >/dev/null 2>&1
service cron reload >/dev/null 2>&1
read  -n 1 -s -r -p  "   Press any key to back on menu " 
autokill
}

function stop()  {
clear
rm /etc/cron.d/tendang
echo -e ""
echo -e "======================================"
echo -e ""
echo -e "      AutoKill MultiLogin Turned Off  "
echo -e ""
echo -e "======================================"
service cron restart >/dev/null 2>&1
service cron reload >/dev/null 2>&1
read  -n 1 -s -r -p  "   Press any key to back on menu " 
autokill 
}

clear
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[44;1;39m             AUTOKILL SSH          \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Status Autokill : $sts        "
echo -e ""
echo -e "[1]  AutoKill After 5 Minutes"
echo -e "[2]  AutoKill After 10 Minutes"
echo -e "[3]  AutoKill After 15 Minutes"
echo -e "[4]  Turn Off AutoKill/MultiLogin"
echo ""
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p "Select From Options [1-4 or x] :  " AutoKill
if [ -z $AutoKill ]; then
autokill
fi
read -p "Multilogin Maximum Number Of Allowed: " max
echo -e ""
case $AutoKill in
01 | 1) clear  ;  lima ;; 
02 | 2) clear  ;  sepuluh ;;
03 | 3) clear  ;  limabelas ;; 
02 | 4) clear  ;  stop ;; 
00 | 0) clear  ;  m-sshovpn ;; 
* ) clear  ;  m-sshovpn ;;
esac

}

function  addssh(){ 
clear 
domen= ` cat /etc/xray/domain ` 
portsshws= ` cat  ~ /log-install.txt  |  grep -w  " SSH Websocket "  |  cut -d: -f2  |  awk  ' {print $1} ' ` 
wsssl= ` cat /root/log-install.txt  |  grep -w  " SSH SSL Websocket "  |  cut -d: -f2  |  awk  ' {print $1} ' ` 

echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│              • CREATE SSH USER •                │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e "┌─────────────────────────────────────────────────┐"
read -p "    Username :  "  Login 

CEKFILE=/etc/xray/ssh.txt 
if  [  -f  " $CEKFILE "  ] ;  then 
file001= " OK " 
else 
touch /etc/xray/ssh.txt 
fi 

if  grep -qw  " $Login "  /etc/xray/ssh.txt ;  then 
echo -e "│[Error] User \e[31m $Login \e[0m already exist   |"
echo -e "└─────────────────────────────────────────────────┘" 
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘" 
echo  " " 
read  -n 1 -s -r -p  "   Press any key to back on menu " 
m-sshovpn 
else 
echo  " $Login "  >>  /etc/xray/ssh.txt 
fi 

if  [  -z  $Login  ] ;  then 
echo -e "│        [Error] Username cannot be empty         |"
echo -e "└─────────────────────────────────────────────────┘" 
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘" 
echo  " " 
read  -n 1 -s -r -p  "     Press any key to back on menu " 
m-sshovpn 
fi 

read  -p  "    Password :  "  Pass 
if  [  -z  $Pass  ] ;  then 
echo -e "│        [Error] Username cannot be empty         |"
echo -e "└─────────────────────────────────────────────────┘" 
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘" 
echo  " " 
read  -n 1 -s -r -p  "    Press any key to back on menu " 
m-sshovpn 
fi 
read  -p  "    Expired (hari):  "  masaaktif 
if  [  -z  $masaaktif  ] ;  then 
echo -e "│        [Error] EXP Date cannot be empty         |"
echo -e "└─────────────────────────────────────────────────┘" 
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘" 
echo  " " 
read  -n 1 -s -r -p  "   Press any key to back on menu " 
m-sshovpn 
fi 

IP= $( curl -sS ifconfig.me ) ; 
ossl= ` cat /root/log-install.txt  |  grep -w  " OpenVPN "  |  cut -f2 -d:  |  awk  ' {print $6} ' ` 
opensh= ` cat /root/log-install.txt  |  grep -w  " OpenSSH "  |  cut -f2 -d:  |  awk  ' {print $1} ' ` 
db= ` cat /root/log-install.txt  |  grep -w  " Dropbear "  |  cut -f2 -d:  |  awk  ' {print $1,$2} ' ` 
ssl= " $( cat  ~ /log-install.txt  |  grep -w  " Stunnel4 "  |  cut -d: -f2 ) " 
sqd= " $( cat  ~ /log-install.txt  |  grep -w  " Squid "  |  cut -d: -f2 ) " 
ovpn= " $( netstat -nlpt  |  grep -i openvpn  |  grep -i 0.0.0.0  |  awk  ' {print $4} '  |  cut -d: -f2 ) " 
ovpn2= " $( netstat -nlpu  |  grep -i openvpn  |  grep -i 0.0.0.0  |  awk  ' {print $4} '  |  cut -d: -f2 ) " 
dnsdomain= $( cat /root/nsdomain ) 
dnskey= $( cat /etc/slowdns/server.pub ) 
OhpSSH= ` cat /root/log-install.txt  |  grep -w  " OHP SSH "  |  cut -d: -f2  |  awk  ' {print $1} ' ` 
OhpDB= ` cat /root/log-install.txt  |  grep -w  " OHP DBear "  |  cut -d: -f2  |  awk  ' {print $1} ' ` 
OhpOVPN= ` cat /root/log-install.txt  |  grep -w  " OHP OpenVPN "  |  cut -d: -f2  |  awk  ' {print $1} ' ` 

sleep 1 
clear 
useradd -e  ` date -d  " $masaaktif  days "  + " %Y-%m-%d " `  -s /bin/false -M  $Login 
exp= " $( chage -l  $Login  |  grep  " Account expires "  |  awk -F " :  "  ' {print $2} ' ) " 
echo  -e  " $Pass \n $Pass \n " | passwd  $Login  & >  /dev/null 
PID= ` ps -ef  | grep -v grep  |  grep sshws  | awk  ' {print $2} ' ` 

if  [[  !  -z  " ${PID} "  ]] ;  then 
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│                • CREATE SSH USER •              │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e "┌─────────────────────────────────────────────────┐" 
echo -e "│    Username   :  $Login                         │"  
echo -e "│    Password   :  $Pass                          │" 
echo -e "│    Expired On :  $exp                           │"  
echo -e "└─────────────────────────────────────────────────┘" 
echo -e "      IP         :  $IP "  
echo -e "      Host       :  $domen "  
echo -e "      OpenSSH    :  $opensh " 
echo -e "      Dropbear   :  $db "  
echo -e "      SSH-WS     :  $portsshws , 8880 "  
echo -e "      SSH-SSL-WS :  $wsssl "  
echo -e "      SSL/TLS    :  $ssl "  
echo -e "      UDPGW      :  7100-7300 "  
echo -e "└─────────────────────────────────────────────────┘  " 
echo -e "┌─────────────────────────────────────────────────┐  " 
echo -e "  GET wss://bug.com/ HTTP/1.1[crlf]Host: [host] [crlf]Upgrade: websocket[crlf][crlf] " 
echo -e "└─────────────────────────────────────────────────┘  "  
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘" 
else 
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│                • CREATE SSH USER •              │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e "┌─────────────────────────────────────────────────┐" 
echo -e "│    Username   :  $Login                         │"  
echo -e "│    Password   :  $Pass                          │" 
echo -e "│    Expired On :  $exp                           │"  
echo -e "└─────────────────────────────────────────────────┘" 
echo -e "      IP         :  $IP "  
echo -e "      Host       :  $domen "  
echo -e "      OpenSSH    :  $opensh " 
echo -e "      Dropbear   :  $db "  
echo -e "      SSH-WS     :  $portsshws , 8880 "  
echo -e "      SSH-SSL-WS :  $wsssl "  
echo -e "      SSL/TLS    :  $ssl "  
echo -e "      UDPGW      :  7100-7300 "  
echo -e "└─────────────────────────────────────────────────┘  " 
echo -e "┌─────────────────────────────────────────────────┐  " 
echo -e "  GET wss://bug.com/ HTTP/1.1[crlf]Host: [host] [crlf]Upgrade: websocket[crlf][crlf] " 
echo -e "└─────────────────────────────────────────────────┘  "  
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘" 
fi 
echo  -e  " " 
read  -n 1 -s -r -p  "   Press any key to back on menu " 
m-sshovpn 
} 
function  sshwss(){ 
clear 
portdb= ` cat  ~ /log-install.txt  |  grep -w  " Dropbear "  |  cut -d: -f2 | sed  ' s/ //g '  |  cut -f2 -d " , " ` 
portsshws= ` cat  ~ /log-install.txt  |  grep -w  " SSH Websocket "  |  cut -d: -f2  |  awk  ' {print $1} ' ` 
if  [  -f  " /etc/systemd/system/sshws.service "  ] ;  then 
clear 
else 
wget -q -O /usr/bin/proxy3.js  " https://raw.githubusercontent.com/adammoi/anjim/xoc/ssh/proxy3.js " 
cat <<-EOF> /etc/systemd/system/sshws.service 
[Unit] 
Description=WSenabler 
Documentation=https://github.com/adammoi 
[Service] 
Type=simple 
ExecStart=/usr/bin/ssh-wsenabler 
KillMode=process 
Restart=on-failure 
RestartSec=1s 
[Install] 
WantedBy=multi-user.target 
EOF

fi 

function  start()  { 
clear 
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│                 • WEBSOCKET MENU •              │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e "┌─────────────────────────────────────────────────┐  "  
wget -q -O /usr/bin/ssh-wsenabler  " https://raw.githubusercontent.com/adammoi/anjim/xoc/ssh/sshws-true.sh "  &&  chmod +x /usr/bin/ssh-wsenabler 
systemctl daemon-reload  > /dev/null  2>&1 
systemctl  enable  sshws.service  > /dev/null  2>&1 
systemctl start sshws.service  > /dev/null  2>&1 
sed -i  " /SSH Websocket/c\   - SSH Websocket           :  $portsshws  [ON] "  /root/log-install.txt 
echo -e "     [INFO] •  ${green} SSH Websocket Started  " 
echo -e "     [INFO] • Restart is require for Changes " 
echo -e "              to take effect " 
echo -e "└─────────────────────────────────────────────────┘  "  
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘"  
echo -e " " 
read  -n 1 -s -r -p  "   Press any key to back on menu " 
sshwss  
} 

function  stop()  { 
    clear 
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│                 • WEBSOCKET MENU •              │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e "┌─────────────────────────────────────────────────┐  "  
systemctl stop sshws.service  > /dev/null  2>&1 
tmux kill-session -t sshws  > /dev/null  2>&1 
sed -i  " /SSH Websocket/c\   - SSH Websocket           :  $portsshws  [OFF] "  /root/log-install.txt 
echo -e "│    [INFO] •  ${red} SSH Websocket Stopped       │" 
echo -e "│    [INFO] • Restart is require for Changes      │" 
echo -e "│             to take effect                      │" 
echo -e "└─────────────────────────────────────────────────┘"  
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘"  
echo  -e  " " 
read  -n 1 -s -r -p  "   Press any key to back on menu " 
sshwss  
} 

clear 
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│                 • WEBSOCKET MENU •              │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e "┌─────────────────────────────────────────────────┐  " 
PID= ` ps -ef  | grep -v grep  |  grep sshws  | awk  ' {print $2} ' ` 
if  [[  !  -z  " ${PID} "  ]] ;  then 
echo -e "      • Websocket Is   Running           " 
else 
echo -e "      • Websocket Is  ${red} Not Running          " 
fi 
echo -e "   "   
echo -e "       [01]   • Enable SSH WS     [02]   • Disable SSH WS " 
echo -e "   "   
echo -e "       [00]   • GO BACK " 
echo -e "└─────────────────────────────────────────────────┘  "  
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘"   
echo  " " 
read  -p  "  Select menu :   "   opt 
echo  -e  " " 
case  $opt  in 
01 | 1) clear  ;  start ;; 
02 | 2) clear  ;  stop ;; 
00 | 0) clear  ;  m-sshovpn ;; 
* ) clear  ;  m-sshovpn ;; 
esac 
}
function  cekssh(){ 

clear 
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│               • SSH ACTIVE USERS •              │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e "┌─────────────────────────────────────────────────┐  " 
echo -e " " 

if [ -e "/var/log/auth.log" ] ; then 
        LOG="/var/log/auth.log" ; 
fi
if [ -e "/var/log/secure" ] ; then 
        LOG="/var/log/secure" ; 
fi 
               
data=(`ps aux | grep -i dropbear | awk '{print $2}'`) ; 
cat $LOG | grep -i dropbear | grep -i  "Password auth succeeded" > /tmp/login-db.txt; 
for PID in "${data[@]}" 
do
        cat /tmp/login-db.txt | grep "dropbear\[$PID\]" > /tmp/login-db-pid.txt ; 
NUM=`cat /tmp/login-db-pid.txt | wc -l ` ; 
        USER=`cat /tmp/login-db-pid.txt | awk '{print $10}'`; 
        IP=`cat /tmp/login-db-pid.txt  |  awk  ' {print $12} ' ` ; 
        if [ $NUM -eq 1 ] ; then 
                echo "$PID - $USER - $IP" ; 
        fi

done 
echo  "  " 
cat $LOG | grep -i sshd | grep -i "Accepted password for" > /tmp/login-db.txt 
data=(`ps aux | grep "\[priv\]" | sort -k 72 | awk '{print $2}'`) ; 

for PID in "${data[@]}" 
do 
        cat /tmp/login-db.txt | grep "sshd\[$PID\]" > /tmp/login-db-pid.txt ; 
NUM=`cat /tmp/login-db-pid.txt | wc-l` ; 
        USER=`cat /tmp/login-db-pid.txt | awk '{print $9}'` ; 
        IP=`cat /tmp/login-db-pid.txt | awk '{print $11}'` ; 
        if  [ $NUM -eq 1 ] ;  then 
                echo "$PID - $USER - $IP" ; 
        fi 


done 
if [ -f "/etc/openvpn/server/openvpn-tcp.log" ] ;  then 
        echo  "  " 

        cat /etc/openvpn/server/openvpn-tcp.log | grep -w "^CLIENT_LIST" | cut -d ',' -f 2,3,8 | sed -e 's/,/     /g' > /tmp/vpn-login-tcp.txt 
        cat /tmp/vpn-login-tcp.txt 
fi 

if [ -f "/etc/openvpn/server/openvpn-udp.log"  ] ;  then 
        echo  "  " 

        cat /etc/openvpn/server/openvpn-udp.log | grep -w "^CLIENT_LIST" | cut -d ',' -f 2,3,8 | sed -e 's/,/     /g' > /tmp/vpn-login-udp.txt 
        cat /tmp/vpn-login-udp.txt 
fi 


rm -f /tmp/login-db-pid.txt 
rm -f /tmp/login-db.txt 
rm -f /tmp/vpn-login-tcp.txt 
rm -f /tmp/vpn-login-udp.txt 
echo -e "└─────────────────────────────────────────────────┘  "  
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘" 
echo  " " ; 
read  -n 1 -s -r -p  "    Press any key to back on menu " 
m-sshovpn 
} 

function  delssh(){ 
clear
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│                • DELETE SSH USER •              │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e "┌─────────────────────────────────────────────────┐  " 
read -p "    Username :  "  Pengguna 

if [ -z  $User ] ;  then 
echo -e "    [Error] Username cannot be empty  " 
else 
if  getent passwd  $Pengguna  >  /dev/null  2>&1 ;  then 
userdel  $Pengguna  >  /dev/null  2>&1 
sed -i  " s/ $Pengguna //g "  /etc/xray/ssh.txt 
echo -e "    [INFO] User  $Pengguna  was removed. " 
else 
echo -e "    [INFO] Failure: User  $Pengguna  Not Exist. " 
fi 
fi 
echo -e "└─────────────────────────────────────────────────┘" 
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘"  
echo  -e  " " 
read  -n 1 -s -r -p  "    Press any key to back on menu " 
m-sshovpn 
} 

function  renewssh(){ 
clear 
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│             • RENEW SSH ACCOUNT •               │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e "┌─────────────────────────────────────────────────┐  " 
read -p "    Username :  "  User 

if  getent passwd  $User  >  /dev/null  2>&1 ;  then 
ok="ok"
else
echo -e "│     [INFO] Failure: User  $User  Not Exist.     │" 
echo -e "└─────────────────────────────────────────────────┘" 
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘"  
echo  " " 
read  -n 1 -s -r -p  "    Press any key to back on menu " 
menu 
fi 

if  [  -z  $User  ] ;  then 
echo -e "│        [Error] Username cannot be empty         |"
echo -e "└─────────────────────────────────────────────────┘" 
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘"
echo  " " 
read  -n 1 -s -r -p  "    Press any key to back on menu " 
menu 
fi 

egrep  " ^ $User "  /etc/passwd  > /dev/null 
if  [  $?  -eq  0 ] ;  then 
read  -p  " Day Extend :  "  Days 
if  [  -z  $Days  ] ;  then 
Days= " 1 " 
fi 
Today= ` date +%s ` 
Days_Detailed= $((  $Days  *  86400  )) 
Expire_On= $(( $Today  +  $Days_Detailed )) 
Expiration= $( date -u --date= " 1970-01-01  $Expire_On  sec GMT "  +%Y/%m/%d ) 
Expiration_Display= $( date -u --date= " 1970-01-01  $Expire_On  sec GMT "  ' +%d %b %Y ' ) 
passwd -u  $User 
usermod -e   $Expiration  $User 
egrep  " ^ $User "  /etc/passwd  > /dev/null 
echo  -e  " $Pass \n $Pass \n " | passwd  $User  & >  /dev/null 
clear 
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│             • RENEW SSH ACCOUNT •               │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e "┌─────────────────────────────────────────────────┐  " 
echo -e "    Username   :  $User " 
echo -e "    Days Added :  $Days  Days " 
echo -e "    Expires on :  $Expiration_Display " 
echo -e "└─────────────────────────────────────────────────┘" 
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘"
else 
clear 
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│             • RENEW SSH ACCOUNT •               │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e "┌─────────────────────────────────────────────────┐  " 
echo -e "    Username Doesnt Exist       " 
echo -e "└─────────────────────────────────────────────────┘" 
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘"
fi 
echo  " " 
read  -n 1 -s -r -p  "    Press any key to back on menu " 
m-sshovpn 
} 


function  memberssh(){ 
clear 
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│             • LIST SSH ACCOUNT •                │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e "┌─────────────────────────────────────────────────┐  "     
echo  "    USERNAME          EXP DATE          STATUS " 
echo -e "└─────────────────────────────────────────────────┘  " 
echo -e "┌─────────────────────────────────────────────────┐  "   
while  read  expired 
do 
AKUN="$(echo $expired | cut -d: -f1)" 
ID="$(echo $expired | grep -v nobody | cut -d: -f3)" 
exp="$(chage -l  $AKUN | grep "Account expires" | awk -F ":" '{print $2}')" 
status="$(passwd -S $AKUN | awk '{print $2}')" 
if [[ $ID  -ge  1000 ]] ; then 
if [[ "$status" = "L" ]] ; then 
printf "%-17s %2s %-17s %2s \n" "   • $AKUN" "$exp     " "LOCKED"
else
printf "%-17s %2s %-17s %2s \n" "   • $AKUN" "$exp     " "UNLOCKED"
fi
fi
done < /etc/passwd
JUMLAH="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
echo -e "└─────────────────────────────────────────────────┘"
echo -e "┌─────────────────────────────────────────────────┐"  
echo "   Total: $JUMLAH User"
echo -e "└─────────────────────────────────────────────────┘" 
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘"
echo  " " 
read  -n 1 -s -r -p  "    Press any key to back on menu " 
m-sshovpn 
} 

function  trialssh(){ 
clear 
domen= ` cat /etc/xray/domain ` 
portsshws= ` cat  ~ /log-install.txt  |  grep -w  " SSH Websocket "  |  cut -d: -f2  |  awk  ' {print $1} ' ` 
wsssl= ` cat /root/log-install.txt  |  grep -w  " SSH SSL Websocket "  |  cut -d: -f2  |  awk  ' {print $1} ' ` 
clear 
IP= $( curl -sS ifconfig.me ) ; 
ossl= ` cat /root/log-install.txt  |  grep -w  " OpenVPN "  |  cut -f2 -d:  |  awk  ' {print $6} ' ` 
opensh= ` cat /root/log-install.txt  |  grep -w  " OpenSSH "  |  cut -f2 -d:  |  awk  ' {print $1} ' ` 
db= ` cat /root/log-install.txt  |  grep -w  " Dropbear "  |  cut -f2 -d:  |  awk  ' {print $1,$2} ' ` 
ssl= " $( cat  ~ /log-install.txt  |  grep -w  " Stunnel4 "  |  cut -d: -f2 ) " 
OhpSSH= ` cat /root/log-install.txt  |  grep -w  " OHP SSH "  |  cut -d: -f2  |  awk  ' {print $1} ' ` 
dnsdomain= $( cat /root/nsdomain ) 
dnskey= $( cat /etc/slowdns/server.pub ) 


Login=ssnvpn ` < /dev/urandom tr -dc X-Z0-9  |  head -c4 ` 
hari= " 1 " 
Pass=1 
echo  Ping Host  & >  /dev/null 
echo  Create Akun:  $Login  & >  /dev/null 
sleep 0.5 
echo  Setting Password:  $Pass  & >  /dev/null 
sleep 0.5 
clear 
useradd -e  ` date -d  " $masaaktif  days "  + " %Y-%m-%d " `  -s /bin/false -M  $Login 
exp= " $( chage -l  $Login  |  grep  " Account expires "  |  awk -F " :  "  ' {print $2} ' ) " 
echo  -e  " $Pass \n $Pass \n " | passwd  $Login  & >  /dev/null 
PID= ` ps -ef  | grep -v grep  |  grep sshws  | awk  ' {print $2} ' ` 

if [[ ! -z "${PID}" ]]; then
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│              • SSH TRIAL ACCOUNT •              │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e "┌─────────────────────────────────────────────────┐" 
echo -e "│    Username   :  $Login                         │"  
echo -e "│    Password   :  $Pass                          │" 
echo -e "│    Expired On :  $exp                           │"  
echo -e "└─────────────────────────────────────────────────┘" 
echo -e "      IP         :  $IP "  
echo -e "      Host       :  $domen "  
echo -e "      OpenSSH    :  $opensh " 
echo -e "      Dropbear   :  $db "  
echo -e "      SSH-WS     :  $portsshws , 8880 "  
echo -e "      SSH-SSL-WS :  $wsssl "  
echo -e "      SSL/TLS    :  $ssl "  
echo -e "      UDPGW      :  7100-7300 "  
echo -e "└─────────────────────────────────────────────────┘  " 
echo -e "┌─────────────────────────────────────────────────┐  " 
echo -e "  GET wss://bug.com/ HTTP/1.1[crlf]Host: [host] [crlf]Upgrade: websocket[crlf][crlf] " 
echo -e "└─────────────────────────────────────────────────┘  "  
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘"  

else 

echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│              • SSH TRIAL ACCOUNT •              │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e "┌─────────────────────────────────────────────────┐" 
echo -e "│    Username   :  $Login                         │"  
echo -e "│    Password   :  $Pass                          │" 
echo -e "│    Expired On :  $exp                           │"  
echo -e "└─────────────────────────────────────────────────┘" 
echo -e "      IP         :  $IP "  
echo -e "      Host       :  $domen "  
echo -e "      OpenSSH    :  $opensh " 
echo -e "      Dropbear   :  $db "  
echo -e "      SSH-WS     :  $portsshws , 8880 "  
echo -e "      SSH-SSL-WS :  $wsssl "  
echo -e "      SSL/TLS    :  $ssl "  
echo -e "      UDPGW      :  7100-7300 "  
echo -e "└─────────────────────────────────────────────────┘  " 
echo -e "┌─────────────────────────────────────────────────┐  " 
echo -e "  GET wss://bug.com/ HTTP/1.1[crlf]Host: [host] [crlf]Upgrade: websocket[crlf][crlf] " 
echo -e "└─────────────────────────────────────────────────┘  "  
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘" 
fi 
echo  " " 
read  -n 1 -s -r -p  "    Press any key to back on menu " 
m-sshovpn 
} 

function ceklim ()  {
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "         CEK USER MULTI SSH        \E[0m"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if [ -e "/root/log-limit.txt" ]; then
echo "User Who Violate The Maximum Limit";
echo "Time - Username - Number of Multilogin"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
cat /root/log-limit.txt
else
echo " No user has committed a violation"
echo " "
echo " or"
echo " "
echo " The user-limit script not been executed."
fi
echo " ";
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo " ";
read -n 1 -s -r -p "Press any key to back on menu"

m-sshovpn
}

clear 
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│               • SSH PANEL MENU •                │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e "┌─────────────────────────────────────────────────┐"  
echo -e "│   [01] • ADD SSH           [06] • RENEW SSH     │"  
echo -e "│   [02] • TRIAL SSH         [07] • USERS LIST    │"  
echo -e "│   [03] • USER ONLINE       [08] • AUTOKILL      │"  
echo -e "│   [04] • ENABLE WS         [09] • CEK MULOG     │" 
echo -e "│   [05] • DELETE SSH        [00] • GO BACK       │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘" 
echo  -e  " " 
read  -p  "  Select menu :   "   opt 
echo  -e  " " 
case  $opt  in 
01 | 1) clear  ;  addssh ;; 
02 | 2) clear  ;  trialssh ;; 
03 | 3) clear  ;  cekssh ;; 
04 | 4) clear  ;  sshwss ;; 
05 | 5) clear  ;  delssh ;; 
06 | 6) clear  ;  renewssh ;; 
07 | 7) clear  ;  memberssh ;;
08 | 8) clear  ;  autokill ;; 
09 | 9) clear  ;  ceklim ;; 
00 | 0) clear  ;  menu ;; 
* ) clear  ;  m-sshovpn ;; 
esac 
