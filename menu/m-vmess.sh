#!/bin/bash

function delvmess(){
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/xray/config.json")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│              • DELETE VMESS USER •              │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│         • You have no existing clients!         │"
echo -e "└─────────────────────────────────────────────────┘" 
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘" 
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-vmess
fi
clear
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│              • DELETE VMESS USER •              │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e "┌─────────────────────────────────────────────────┐"
grep -E "^### " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | column -t | sort | uniq | nl
echo -e "│                                                 │"
echo -e "│    • [NOTE] Press any key to back on menu       │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e "───────────────────────────────────────────────────"
read -rp "   Input Username : " user
if [ -z $user ]; then
m-vmess
else
exp=$(grep -wE "^### $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
systemctl restart xray > /dev/null 2>&1
clear
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│              • DELETE VMESS USER •              │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│           • Accound Delete Successfully         │"
echo -e "│                                                 │"
echo -e "│              • Client Name : $user              │"
echo -e "│              • Expired On  : $exp               │"
echo -e "└─────────────────────────────────────────────────┘" 
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘" 
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-vmess
fi
}
function renewvmess(){
clear
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│              • RENEW VMESS USER •               │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e "┌─────────────────────────────────────────────────┐"
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/xray/config.json")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
echo -e "│         • You have no existing clients!         │"
echo -e "└─────────────────────────────────────────────────┘" 
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘" 
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-vmess
fi
clear
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│              • RENEW VMESS USER •               │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e "┌─────────────────────────────────────────────────┐"
grep -E "^### " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | column -t | sort | uniq | nl
echo -e "└─────────────────────────────────────────────────┘" 
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘" 
echo -e "───────────────────────────────────────────────────"
read -rp "   Input Username : " user
if [ -z $user ]; then
m-vmess
else
read -p "   Expired (days): " masaaktif
if [ -z $masaaktif ]; then
masaaktif="1"
fi
exp=$(grep -E "^### $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "/### $user/c\### $user $exp4" /etc/xray/config.json
systemctl restart xray > /dev/null 2>&1
clear
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│              • RENEW VMESS USER •               │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│   [INFO]  $user Account Renewed Successfully    |"
echo -e "│                                                 |"
echo -e "│   Client Name : $user                           |"
echo -e "│   Days Added  : $masaaktif Days                 |"
echo -e "│   Expired On  : $exp4                           |"
echo -e "└─────────────────────────────────────────────────┘" 
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘" 
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-vmess
fi
}

function cekvmess(){
clear
echo -n > /tmp/other.txt
data=( `cat /etc/xray/config.json | grep '^###' | cut -d ' ' -f 2 | sort | uniq`);
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│              • VMESS USER ONLINE •              │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e "┌─────────────────────────────────────────────────┐"

for akun in "${data[@]}"
do
if [[ -z "$akun" ]]; then
akun="tidakada"
fi

echo -n > /tmp/ipvmess.txt
data2=( `cat /var/log/xray/access.log | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | sort | uniq`);
for ip in "${data2[@]}"
do

jum=$(cat /var/log/xray/access.log | grep -w "$akun" | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | grep -w "$ip" | sort | uniq)
if [[ "$jum" = "$ip" ]]; then
echo "$jum" >> /tmp/ipvmess.txt
else
echo "$ip" >> /tmp/other.txt
fi
jum2=$(cat /tmp/ipvmess.txt)
sed -i "/$jum2/d" /tmp/other.txt > /dev/null 2>&1
done

jum=$(cat /tmp/ipvmess.txt)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
jum2=$(cat /tmp/ipvmess.txt | nl)
echo -e "│ user : $akun";
echo -e "│ $jum2";
fi
rm -rf /tmp/ipvmess.txt
done

rm -rf /tmp/other.txt
echo -e "└─────────────────────────────────────────────────┘" 
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘" 
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-vmess
}

function addvmess(){
clear
source /var/lib/SIJA/ipvps.conf
domain=$(cat /etc/xray/domain)
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│              • CREATE VMESS USER •              │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e "┌─────────────────────────────────────────────────┐"
tls="$(cat ~/log-install.txt | grep -w "Vmess TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vmess None TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do

read -rp "   Input Username : " -e user
      
if [ -z $user ]; then
echo -e "│        [Error] Username cannot be empty         |"
echo -e "└─────────────────────────────────────────────────┘" 
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘" 
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu
fi
		CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
clear
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│              • CREATE VMESS USER •              │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│           Please choose another name            |"
echo -e "└─────────────────────────────────────────────────┘" 
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘" 
			read -n 1 -s -r -p "   Press any key to back on menu"
menu
		fi
	done

uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "   Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmess$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
asu=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/ottin",
      "type": "none",
      "host": "",
      "tls": "tls"
}
EOF`
ask=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "isi_IPbug_disini",
      "port": "80",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "GET-:wss://HOSTBUG.com/ottin",
      "type": "none",
      "host": "${domain}",
      "tls": "none"
}
EOF`
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmess_base643=$( base64 -w 0 <<< $vmess_json3)
vmesslink1="vmess://$(echo $asu | base64 -w 0)"
vmesslink2="vmess://$(echo $ask | base64 -w 0)"
systemctl restart xray > /dev/null 2>&1
service cron restart > /dev/null 2>&1
clear
echo -e "┌─────────────────────────────────────────────────┐" | tee -a /etc/log-create-user.log
echo -e "│              • CREATE VMESS USER •              │" | tee -a /etc/log-create-user.log
echo -e "└─────────────────────────────────────────────────┘" | tee -a /etc/log-create-user.log
echo -e "┌─────────────────────────────────────────────────┐" | tee -a /etc/log-create-user.log
echo -e "  Remarks       : ${user}" | tee -a /etc/log-create-user.log
echo -e "  Expired On    : $exp" | tee -a /etc/log-create-user.log
echo -e "  Domain        : ${domain}" | tee -a /etc/log-create-user.log
echo -e "  Port TLS      : ${tls}" | tee -a /etc/log-create-user.log
echo -e "  Port none TLS : ${none}" | tee -a /etc/log-create-user.log
echo -e "  Port  GRPC    : ${tls}" | tee -a /etc/log-create-user.log
echo -e "  id            : ${uuid}" | tee -a /etc/log-create-user.log
echo -e "  alterId       : 0" | tee -a /etc/log-create-user.log
echo -e "  Security      : auto" | tee -a /etc/log-create-user.log
echo -e "  Network       : ws" | tee -a /etc/log-create-user.log
echo -e "  Path          : /ottin" | tee -a /etc/log-create-user.log
echo -e "  Path WS New   : GET-:ws://HOSTBUG.com/ottin" | tee -a /etc/log-create-user.log
echo -e "└─────────────────────────────────────────────────┘" | tee -a /etc/log-create-user.log
echo -e "┌─────────────────────────────────────────────────┐" | tee -a /etc/log-create-user.log
echo -e "  Link TLS : " | tee -a /etc/log-create-user.log
echo -e "  ${vmesslink1}" | tee -a /etc/log-create-user.log
echo -e "  " | tee -a /etc/log-create-user.log
echo -e "  Link none TLS : " | tee -a /etc/log-create-user.log
echo -e "  ${vmesslink2}" | tee -a /etc/log-create-user.log 
echo -e "  " | tee -a /etc/log-create-user.log
echo -e "└─────────────────────────────────────────────────┘" | tee -a /etc/log-create-user.log 
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘" 
echo ""
}

function trialvmess ()  {
domain=$(cat /etc/xray/domain)
tls="$(cat ~/log-install.txt | grep -w "Vmess TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vmess None TLS" | cut -d: -f2|sed 's/ //g')"
user=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
uuid=$(cat /proc/sys/kernel/random/uuid)
masaaktif=1
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmess$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
asu=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/ottin",
      "type": "none",
      "host": "",
      "tls": "tls"
}
EOF`
ask=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "isi_IPbug_disini",
      "port": "80",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "GET-:wss://HOSTBUG.com/ottin",
      "type": "none",
      "host": "${domain}",
      "tls": "none"
}
EOF`
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmess_base643=$( base64 -w 0 <<< $vmess_json3)
vmesslink1="vmess://$(echo $asu | base64 -w 0)"
vmesslink2="vmess://$(echo $ask | base64 -w 0)"
systemctl restart xray > /dev/null 2>&1
service cron restart > /dev/null 2>&1
clear
echo -e "┌─────────────────────────────────────────────────┐" | tee -a /etc/log-create-user.log
echo -e "│              • CREATE VMESS USER •              │" | tee -a /etc/log-create-user.log
echo -e "└─────────────────────────────────────────────────┘" | tee -a /etc/log-create-user.log
echo -e "┌─────────────────────────────────────────────────┐" | tee -a /etc/log-create-user.log
echo -e "  Remarks       : ${user}" | tee -a /etc/log-create-user.log
echo -e "  Expired On    : $exp" | tee -a /etc/log-create-user.log
echo -e "  Domain        : ${domain}" | tee -a /etc/log-create-user.log
echo -e "  Port TLS      : ${tls}" | tee -a /etc/log-create-user.log
echo -e "  Port none TLS : ${none}" | tee -a /etc/log-create-user.log
echo -e "  Port  GRPC    : ${tls}" | tee -a /etc/log-create-user.log
echo -e "  id            : ${uuid}" | tee -a /etc/log-create-user.log
echo -e "  alterId       : 0" | tee -a /etc/log-create-user.log
echo -e "  Security      : auto" | tee -a /etc/log-create-user.log
echo -e "  Network       : ws" | tee -a /etc/log-create-user.log
echo -e "  Path          : /ottin" | tee -a /etc/log-create-user.log
echo -e "  Path WS New   : GET-:ws://HOSTBUG.com/ottin" | tee -a /etc/log-create-user.log
echo -e "└─────────────────────────────────────────────────┘" | tee -a /etc/log-create-user.log
echo -e "┌─────────────────────────────────────────────────┐" | tee -a /etc/log-create-user.log
echo -e "  Link TLS : " | tee -a /etc/log-create-user.log
echo -e "  ${vmesslink1}" | tee -a /etc/log-create-user.log
echo -e "  " | tee -a /etc/log-create-user.log
echo -e "  Link none TLS : " | tee -a /etc/log-create-user.log
echo -e "  ${vmesslink2}" | tee -a /etc/log-create-user.log 
echo -e "  " | tee -a /etc/log-create-user.log
echo -e "└─────────────────────────────────────────────────┘" | tee -a /etc/log-create-user.log 
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘" 
echo ""
}

clear
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│              • VMESS PANEL MENU •               │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│   [01] • ADD VMESS      [04] • USER ONLINE      │"
echo -e "│   [02] • RENEW VMESS    [05] • CREATE TRIAL     │"
echo -e "│   [03] • DELETE VMESS   [00] • GO BACK          │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘" 
echo -e ""
read -p " Select menu :  "  opt
echo -e ""
case $opt in
01 | 1) clear ; addvmess ;;
02 | 2) clear ; renewvmess ;;
03 | 3) clear ; delvmess ;;
04 | 4) clear ; cekvmess ;;
05 | 5) clear  ;  trialvmess ;;
00 | 0) clear ; menu ;;
*) clear ; m-vmess ;;
esac

       
