#!/bin/bash
function  cektrojan(){ 
clear 
echo -n > /tmp/other.txt 
data=(`cat /etc/xray/config.json | grep '^#!' | cut -d ' ' -f 2 | sort | uniq`) ; 
echo -e "┌─────────────────────────────────────────────────┐" 
echo -e "│              • TROJAN USER ONLINE •             │"
echo -e "└─────────────────────────────────────────────────┘" 
echo -e "┌─────────────────────────────────────────────────┐" 
for akun in "${data[@]}" 
do
if [[ -z "$akun" ]] ; then 
account="none"
fi
echo -n > /tmp/iptrojan.txt 
data2=(`cat /var/log/xray/access.log | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | sort | uniq`) ; 
for ip in "${data2[@]}" 
do

jum=$(cat /var/log/xray/access.log | grep -w "$akun" | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | grep -w "$ip" | sort | uniq) 
if [[ "$jum" = "$ip" ]] ; then 
echo "$jum" >> /tmp/iptrojan.txt 
else
echo "$ip" >> /tmp/other.txt 
fi
jum2=$(cat /tmp/iptrojan.txt ) 
sed -i "/$jum2/d" /tmp/other.txt > /dev/null  2>&1 
done 

day=$(cat /tmp/iptrojan.txt ) 
if [[ -z "$jum" ]] ;  then 
echo > /dev/null 
else 
jum2=$(cat /tmp/iptrojan.txt | nl ) 
echo -e "│     user :  $akun                               |" ; 
echo -e "│     $jum2                                       |" ; 
fi 
rm -rf /tmp/iptrojan.txt 
done 

rm -rf /tmp/other.txt 
echo -e "└─────────────────────────────────────────────────┘"  
echo -e "┌────────────────────── BY ───────────────────────┐" 
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘"  
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-trojan
}


function deltrojan(){
    clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#! " "/etc/xray/config.json")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│              • DELETE TROJAN USER •             │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│         • You have no existing clients!         │"
echo -e "└─────────────────────────────────────────────────┘" 
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘" 
echo  " " 
read  -n 1 -s -r -p  "    Press any key to back on menu " 
m-trojan
fi 
clear 
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│              • DELETE TROJAN USER •             │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e "┌─────────────────────────────────────────────────┐"
grep -E "^#! " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | column -t | sort | uniq | nl
echo -e "│                                                 │"
echo -e "│    • [NOTE] Press any key to back on menu       │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e "───────────────────────────────────────────────────"
read -rp "   Input Username : " user
if [ -z $user ]; then
m-trojan
else
exp=$(grep -wE "^#! $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
sed -i "/^#! $user $exp/,/^},{/d" /etc/xray/config.json
systemctl restart xray > /dev/null 2>&1
clear
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│              • DELETE TROJAN USER •             │"
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
echo  " " 
read  -n 1 -s -r -p  "    Press any key to back on menu " 
m-trojan
fi 
} 

function  renewtrojan(){ 
clear 
echo -e "┌─────────────────────────────────────────────────┐" 
echo -e "│              • RENEW TROJAN USER •              │"
echo -e "└─────────────────────────────────────────────────┘" 
echo -e "┌─────────────────────────────────────────────────┐" 
NUMBER_OF_CLIENTS=$(grep -c -E "^#! " "/etc/xray/config.json")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
echo -e "│         • You have no existing clients!         │"
echo -e "└─────────────────────────────────────────────────┘"  
echo -e "┌────────────────────── BY ───────────────────────┐" 
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘"  
echo  " " 
read  -n 1 -s -r -p  "    Press any key to back on menu " 
m-trojan
fi 
clear 
echo -e "┌─────────────────────────────────────────────────┐" 
echo -e "│              • RENEW TROJAN USER •              │"
echo -e "└─────────────────────────────────────────────────┘" 
echo -e "┌─────────────────────────────────────────────────┐"
grep -E "^#! " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | column -t | sort | uniq | nl
echo -e "└─────────────────────────────────────────────────┘" 
echo -e "┌────────────────────── BY ───────────────────────┐" 
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘"  
echo -e "───────────────────────────────────────────────────"
read -rp "   Input Username : " user
if [ -z $user ]; then
m-trojan
else
read -p "   Expired (days): " masaaktif
if [ -z $masaaktif ]; then
masaaktif="1"
fi
exp=$(grep -E "^#! $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "/#! $user/c\#! $user $exp4" /etc/xray/config.json
systemctl restart xray > /dev/null 2>&1
clear
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│              • RENEW TROJAN USER •              │"
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
echo  " " 
read  -n 1 -s -r -p  "    Press any key to back on menu " 
m-trojan
fi 
} 

function  addtrojan(){ 
domain=$(cat /etc/xray/domain) 
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│              • CREATE TROJAN USER •             │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e "┌─────────────────────────────────────────────────┐"
tr="$(cat ~/log-install.txt | grep -w "Trojan WS" | cut -d: -f2 | sed ' s/ //g ')" 
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]] ; do 
read  -rp  "    Input Username :  "  -e user 
if  [  -z  $user  ] ;  then 
echo -e "│        [Error] Username cannot be empty         |"
echo -e "└─────────────────────────────────────────────────┘" 
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘" 
echo  " " 
read  -n 1 -s -r -p  "    Press any key to back on menu " 
m-trojan 
fi 
user_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l ) 
if [[ ${user_EXISTS} == '1' ]] ; then 
clear 
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│              • CREATE TROJAN USER •             │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│           Please choose another name            |"
echo -e "└─────────────────────────────────────────────────┘" 
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘"  
read  -n 1 -s -r -p  "    Press any key to back on menu " 
m-trojan 
fi 
done 
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "   Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#trojanws$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#trojangrpc$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
systemctl restart xray 
trojanlink1= "trojan://${uuid}@${domain}:${tr}?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=bug.com#${user}" 
trojanlink= "trojan://${uuid}@${domain}:${tr}?path=%2Ftrojan-ws&security=tls&host=bug.com&type=ws&sni=bug.com#${user}" 
clear 
echo -e "┌─────────────────────────────────────────────────┐" | tee -a /etc/log-create-user.log
echo -e "│              • CREATE TROJAN USER •             │" | tee -a /etc/log-create-user.log
echo -e "└─────────────────────────────────────────────────┘" | tee -a /etc/log-create-user.log
echo -e "┌─────────────────────────────────────────────────┐" | tee -a /etc/log-create-user.log
echo -e "  Remarks     :  ${user} " | tee -a /etc/log-create-user.log 
echo -e "  Expired On  :  $exp " | tee -a /etc/log-create-user.log 
echo -e "  Host/IP     :  ${domain} " | tee -a /etc/log-create-user.log 
echo -e "  Port        :  ${tr} " | tee -a /etc/log-create-user.log 
echo -e "  Key         :  ${uuid} " | tee -a /etc/log-create-user.log 
echo -e "  Path        :  /trojan-ws " | tee -a /etc/log-create-user.log
echo -e "  Path WSS    :  wss://bug.com/trojan-ws " | tee -a /etc/log-create-user.log 
echo -e "  ServiceName :  trojan-grpc " | tee -a /etc/log-create-user.log 
echo -e "└─────────────────────────────────────────────────┘  " | tee -a /etc/log-create-user.log 
echo -e "┌─────────────────────────────────────────────────┐  " | tee -a /etc/log-create-user.log
echo -e "  Link WS :  " | tee -a /etc/log-create-user.log
echo -e "  ${trojanlink} " | tee -a /etc/log-create-user.log 
echo -e "  " | tee -a /etc/log-create-user.log
echo -e "  Link GRPC :  " | tee -a /etc/log-create-user.log
echo -e "  ${trojanlink1} " | tee -a /etc/log-create-user.log
echo -e "└─────────────────────────────────────────────────┘" | tee -a /etc/log-create-user.log 
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘"  
echo " "  
} 

function trialtrojan ()  {
domain=$(cat /etc/xray/domain)
tr="$(cat ~/log-install.txt | grep -w "Trojan WS" | cut -d: -f2|sed 's/ //g')"
user=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
uuid=$(cat /proc/sys/kernel/random/uuid)
masaaktif=1
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#trojanws$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#trojangrpc$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
systemctl restart xray 
trojanlink1= "trojan://${uuid}@${domain}:${tr}?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=bug.com#${user}" 
trojanlink= "trojan://${uuid}@${domain}:${tr}?path=%2Ftrojan-ws&security=tls&host=bug.com&type=ws&sni=bug.com#${user}" 
clear 
echo -e "┌─────────────────────────────────────────────────┐" | tee -a /etc/log-create-user.log
echo -e "│             • CREATE TRIAL TROJAN  •            │" | tee -a /etc/log-create-user.log
echo -e "└─────────────────────────────────────────────────┘" | tee -a /etc/log-create-user.log
echo -e "┌─────────────────────────────────────────────────┐" | tee -a /etc/log-create-user.log
echo -e "  Remarks     :  ${user} " | tee -a /etc/log-create-user.log 
echo -e "  Expired On  :  $exp " | tee -a /etc/log-create-user.log 
echo -e "  Host/IP     :  ${domain} " | tee -a /etc/log-create-user.log 
echo -e "  Port        :  ${tr} " | tee -a /etc/log-create-user.log 
echo -e "  Key         :  ${uuid} " | tee -a /etc/log-create-user.log 
echo -e "  Path        : /trojan-ws " | tee -a /etc/log-create-user.log
echo -e "  Path WSS    : wss://bug.com/trojan-ws " | tee -a /etc/log-create-user.log 
echo -e "  ServiceName : trojan-grpc " | tee -a /etc/log-create-user.log 
echo -e "└─────────────────────────────────────────────────┘  " | tee -a /etc/log-create-user.log 
echo -e "┌─────────────────────────────────────────────────┐  " | tee -a /etc/log-create-user.log
echo -e "  Link WS :  " | tee -a /etc/log-create-user.log
echo -e "  ${trojanlink} " | tee -a /etc/log-create-user.log 
echo -e "  " | tee -a /etc/log-create-user.log
echo -e "  Link GRPC :  " | tee -a /etc/log-create-user.log
echo -e "  ${trojanlink1} " | tee -a /etc/log-create-user.log
echo -e "└─────────────────────────────────────────────────┘" | tee -a /etc/log-create-user.log 
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘"  
echo " "
}

clear 
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│              • TROJAN PANEL MENU •              │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│   [01] • ADD TROJAN      [04] • USER ONLINE     │"
echo -e "│   [02] • RENEW TROJAN    [05] • CREATE TRIAL    │"
echo -e "│   [03] • DELETE TROJAN   [00] • GO BACK         │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘"  
echo  -e  " " 
read  -p  "  Select menu :   "   opt 
echo  -e  " " 
case  $opt  in 
01 | 1) clear  ;  addtrojan ;; 
02 | 2) clear  ;  renewtrojan ;; 
03 | 3) clear  ;  deltrojan ;; 
04 | 4) clear  ;  cektrojan ;; 
05 | 4) clear  ;  trialtrojan ;; 
00 | 0) clear  ;  menu ;; 
* ) clear  ;  m-trojan;; 
esac 

       
