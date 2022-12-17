#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`

function  cekvless(){ 
clear 
echo -n > /tmp/other.txt 
data=(  ` cat /etc/xray/config.json  |  grep  ' #& '  |  cut -d  '  '  -f 2  |  sort  |  uniq ` ) ; 
echo -e "┌─────────────────────────────────────────────────┐" 
echo -e "│              • VLESS USER ONLINE •              │"
echo -e "└─────────────────────────────────────────────────┘" 
echo -e "┌─────────────────────────────────────────────────┐" 

for  akun  in  " ${data[@]} " 
do 
if  [[  -z  " $akun "  ]] ;  then 
account = " none " 
fi 

echo -n > /tmp/ipvless.txt 
data2=(  ` cat /var/log/xray/access.log  |  tail -n 500  |  cut -d  "  "  -f 3  |  sed  ' s/tcp://g '  |  cut -d  " : "  -f 1  |  sort  |  uniq ` ) ; 
for  ip  in  " ${data2[@]} " 
do 

jum= $( cat /var/log/xray/access.log  |  grep -w  " $akun "  |  tail -n 500  |  cut -d  "  "  -f 3  |  sed  ' s/tcp://g '  |  cut -d  " : "  -f 1  |  grep -w  " $ip "  |  sort  |  uniq ) 
if  [[  " $jum "  =  " $ip "  ]] ;  then 
echo  " $jum "  >>  /tmp/ipvless.txt 
else 
echo  " $ip "  >>  /tmp/other.txt 
fi 
jum2= $( cat /tmp/ipvless.txt ) 
sed -i  " / $jum2 /d "  /tmp/other.txt  >  /dev/null  2>&1 
done 

day= $( cat /tmp/ipvless.txt ) 
if  [[  -z  " $jum "  ]] ;  then 
echo  >  /dev/null 
else 
jum2= $( cat /tmp/ipvless.txt  |  nl ) 
echo -e "│     user :  $akun                               |" ; 
echo -e "│     $jum2                                       |" ; 
fi 
rm -rf /tmp/ipvless.txt 
done 

rm -rf /tmp/other.txt 
echo -e "└─────────────────────────────────────────────────┘"  
echo -e "┌────────────────────── BY ───────────────────────┐" 
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘"  
echo  " " 
read  -n 1 -s -r -p  "    Press any key to back on menu " 
m-vless 
} 

function  renewvless(){ 
clear 
echo -e "┌─────────────────────────────────────────────────┐" 
echo -e "│              • RENEW VLESS USER •               │"
echo -e "└─────────────────────────────────────────────────┘" 
echo -e "┌─────────────────────────────────────────────────┐" 
NUMBER_OF_CLIENTS= $( grep -c -E  " ^#&  "  " /etc/xray/config.json " ) 
if  [[  ${NUMBER_OF_CLIENTS}  ==  ' 0 '  ]] ;  then 
echo -e "│         • You have no existing clients!         │"
echo -e "└─────────────────────────────────────────────────┘"  
echo -e "┌────────────────────── BY ───────────────────────┐" 
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘"  
echo  " " 
read  -n 1 -s -r -p  "    Press any key to back on menu " 
m-vless 
fi 
clear 
echo -e "┌─────────────────────────────────────────────────┐" 
echo -e "│              • RENEW VLESS USER •               │"
echo -e "└─────────────────────────────────────────────────┘" 
echo -e "┌─────────────────────────────────────────────────┐"
grep -E "^#& " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | column -t | sort | uniq | nl
echo -e "└─────────────────────────────────────────────────┘" 
echo -e "┌────────────────────── BY ───────────────────────┐" 
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘"  
echo -e "───────────────────────────────────────────────────"
read -rp "   Input Username : " user
if [ -z $user ]; then
m-vless
else
read -p "   Expired (days): " masaaktif
if [ -z $masaaktif ]; then
masaaktif="1"
fi 
exp= $( grep -E  " ^#&  $user "  " /etc/xray/config.json "  |  cut -d  '  '  -f 3  |  sort  |  uniq ) 
now= $( date +%Y-%m-%d ) 
d1= $( date -d  " $exp "  +%s ) 
d2= $( date -d  " $now "  +%s ) 
exp2= $(( (d 1  - d 2 ) /  86400  )) 
exp3= $(( $exp2  +  $active )) 
exp4= ` date -d  " $exp3  days "  + " %Y-%m-%d " ` 
sed -i  " /#&  $user /c\#&  $user  $exp4 "  /etc/xray/config.json 
systemctl restart xray  >  /dev/null  2>&1 
clear 
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│              • RENEW VLESS USER •               │"
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
m-vless 
fi 
} 

function  delvless(){ 
clear 
NUMBER_OF_CLIENTS= $( grep -c -E  " ^#&  "  " /etc/xray/config.json " ) 
if  [[  ${NUMBER_OF_CLIENTS}  ==  ' 0 '  ]] ;  then 
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│              • DELETE VLESS USER •              │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│         • You have no existing clients!         │"
echo -e "└─────────────────────────────────────────────────┘" 
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘" 
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-vless 
fi 
clear 
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│              • DELETE VLESS USER •              │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e "┌─────────────────────────────────────────────────┐"
grep -E "^#& " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | column -t | sort | uniq | nl
echo -e "│                                                 │"
echo -e "│    • [NOTE] Press any key to back on menu       │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e "───────────────────────────────────────────────────"
read -rp "   Input Username : " user
if [ -z $user ]; then
m-vless 
else 
exp= $( grep -wE  " ^#&  $user "  " /etc/xray/config.json "  |  cut -d  '  '  -f 3  |  sort  |  uniq ) 
sed -i  " /^#&  $user  $exp /,/^},{/d "  /etc/xray/config.json 
systemctl restart xray  >  /dev/null  2>&1 
clear 
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│              • DELETE VLESS USER •              │"
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
m-vless 
fi 
} 

function  addvless(){ 
domain= $( cat /etc/xray/domain ) 
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│              • CREATE VLESS USER •              │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e "┌─────────────────────────────────────────────────┐"
tls= " $( cat  ~ /log-install.txt  |  grep -w  " Vless TLS "  |  cut -d: -f2 | sed  ' s/ //g ' ) " 
none= " $( cat  ~ /log-install.txt  |  grep -w  " Vless None TLS "  |  cut -d: -f2 | sed  ' s/ //g ' ) " 
until  [[  $user  =~  ^[a-zA-Z0-9_]+$  &&  ${CLIENT_EXISTS}  ==  ' 0 '  ]] ;  do 
		read  -rp  "   Input Username :  "  -e user 
        if  [  -z  $user  ] ;  then 
echo -e "│        [Error] Username cannot be empty         |"
echo -e "└─────────────────────────────────────────────────┘" 
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘" 
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu 
fi 
		CLIENT_EXISTS= $( grep -w  $user  /etc/xray/config.json  |  wc -l ) 

if  [[  ${CLIENT_EXISTS}  ==  ' 1 '  ]] ;  then 
clear
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│              • CREATE VLESS USER •              │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│           Please choose another name            |"
echo -e "└─────────────────────────────────────────────────┘" 
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘" 
echo  " " 
read  -n 1 -s -r -p  "    Press any key to back on menu " 
menu 
fi 
done 

uuid= $( cat /proc/sys/kernel/random/uuid ) 
read  -p  "   Expired (days):  "  masaaktif 
exp= ` date -d  " $masaaktif  days "  + " %Y-%m-%d " ` 
sed -i  ' /#vless$/a\#&  ' " $user  $exp " ' \ 
},{"id": " ' " " $uuid " " ' ","email": " ' " " $user " " ' " '  /etc/xray/config.json 
sed -i  ' /#vlessgrpc$/a\#&  ' " $user  $exp " ' \ 
},{"id": " ' " " $uuid " " ' ","email": " ' " " $user " " ' " '  /etc/xray/config.json 
vlesslink1= " vless:// ${uuid} @ ${domain} : $tls ?path=/vlessws&security=tls&encryption=none&type=ws# ${user} " 
vlesslink2= " vless:// ${uuid} @ ${domain} : $none ?path=/vlessws&encryption=none&type=ws# ${user} " 
vlesslink3= " vless:// ${uuid} @ ${domain} : $tls ?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=bug.com# ${user} " 
systemctl restart xray 
clear 
echo -e "┌─────────────────────────────────────────────────┐" | tee -a /etc/log-create-user.log
echo -e "│              • CREATE VLESS USER •              │" | tee -a /etc/log-create-user.log
echo -e "└─────────────────────────────────────────────────┘" | tee -a /etc/log-create-user.log
echo -e "┌─────────────────────────────────────────────────┐" | tee -a /etc/log-create-user.log
echo -e "  Remarks       :  ${user} " | tee -a /etc/log-create-user.log
echo -e "  Expired On    :  $exp " | tee -a /etc/log-create-user.log 
echo -e "  Domain        :  ${domain} " | tee -a /etc/log-create-user.log 
echo -e "  port TLS      :  $tls " | tee -a /etc/log-create-user.log 
echo -e "  port none TLS :  $none " | tee -a /etc/log-create-user.log 
echo -e "  id            :  ${uuid} " | tee -a /etc/log-create-user.log
echo -e "  Encryption    : none " | tee -a /etc/log-create-user.log 
echo -e "  Network       : ws " | tee -a /etc/log-create-user.log 
echo -e "  Path          : /vless " | tee -a /etc/log-create-user.log 
echo -e "  Path WSS      : wss://bug.com/vless " | tee -a /etc/log-create-user.log 
echo -e "  Path          : vless-grpc " | tee -a /etc/log-create-user.log 
echo -e "└─────────────────────────────────────────────────┘" | tee -a /etc/log-create-user.log 
echo -e "┌─────────────────────────────────────────────────┐" | tee -a /etc/log-create-user.log
echo -e "  Link TLS : " | tee -a /etc/log-create-user.log
echo -e "  ${vlesslink1} " | tee -a /etc/log-create-user.log 
echo -e "  " | tee -a /etc/log-create-user.log   
echo -e "  Link none TLS :  " | tee -a /etc/log-create-user.log
echo -e "  ${vlesslink2} " | tee -a /etc/log-create-user.log 
echo -e "  " | tee -a /etc/log-create-user.log
echo -e "  Link GRPC :  " | tee -a /etc/log-create-user.log
echo -e "  ${vlesslink3} " | tee -a /etc/log-create-user.log 
echo -e "└─────────────────────────────────────────────────┘" | tee -a /etc/log-create-user.log 
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘" 
echo  " "  
} 

function trialvless ()  {
domain=$(cat /etc/xray/domain)
tls="$(cat ~/log-install.txt | grep -w "Vless TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vless None TLS" | cut -d: -f2|sed 's/ //g')"
user=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
uuid=$(cat /proc/sys/kernel/random/uuid)
masaaktif=1
exp= ` date -d  " $masaaktif  days "  + " %Y-%m-%d " ` 
sed -i  ' /#vless$/a\#&  ' " $user  $exp " ' \ 
},{"id": " ' " " $uuid " " ' ","email": " ' " " $user " " ' " '  /etc/xray/config.json 
sed -i  ' /#vlessgrpc$/a\#&  ' " $user  $exp " ' \ 
},{"id": " ' " " $uuid " " ' ","email": " ' " " $user " " ' " '  /etc/xray/config.json 
vlesslink1= " vless:// ${uuid} @ ${domain} : $tls ?path=/vlessws&security=tls&encryption=none&type=ws# ${user} " 
vlesslink2= " vless:// ${uuid} @ ${domain} : $none ?path=/vlessws&encryption=none&type=ws# ${user} " 
vlesslink3= " vless:// ${uuid} @ ${domain} : $tls ?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=bug.com# ${user} " 
systemctl restart xray 
clear 
echo -e "┌─────────────────────────────────────────────────┐" | tee -a /etc/log-create-user.log
echo -e "│              • CREATE TRIAL VLESS •             │" | tee -a /etc/log-create-user.log
echo -e "└─────────────────────────────────────────────────┘" | tee -a /etc/log-create-user.log
echo -e "┌─────────────────────────────────────────────────┐" | tee -a /etc/log-create-user.log
echo -e "  Remarks       :  ${user} " | tee -a /etc/log-create-user.log
echo -e "  Expired On    :  $exp " | tee -a /etc/log-create-user.log 
echo -e "  Domain        :  ${domain} " | tee -a /etc/log-create-user.log 
echo -e "  port TLS      :  $tls " | tee -a /etc/log-create-user.log 
echo -e "  port none TLS :  $none " | tee -a /etc/log-create-user.log 
echo -e "  id            :  ${uuid} " | tee -a /etc/log-create-user.log
echo -e "  Encryption    : none " | tee -a /etc/log-create-user.log 
echo -e "  Network       : ws " | tee -a /etc/log-create-user.log 
echo -e "  Path          : /vless " | tee -a /etc/log-create-user.log 
echo -e "  Path WSS      : wss://bug.com/vless " | tee -a /etc/log-create-user.log 
echo -e "  Path          : vless-grpc " | tee -a /etc/log-create-user.log 
echo -e "└─────────────────────────────────────────────────┘" | tee -a /etc/log-create-user.log 
echo -e "┌─────────────────────────────────────────────────┐" | tee -a /etc/log-create-user.log
echo -e "  Link TLS : " | tee -a /etc/log-create-user.log
echo -e "  ${vlesslink1} " | tee -a /etc/log-create-user.log 
echo -e "  " | tee -a /etc/log-create-user.log   
echo -e "  Link none TLS :  " | tee -a /etc/log-create-user.log
echo -e "  ${vlesslink2} " | tee -a /etc/log-create-user.log 
echo -e "  " | tee -a /etc/log-create-user.log
echo -e "  Link GRPC :  " | tee -a /etc/log-create-user.log
echo -e "  ${vlesslink3} " | tee -a /etc/log-create-user.log 
echo -e "└─────────────────────────────────────────────────┘" | tee -a /etc/log-create-user.log 
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘" 
echo  " "  
}

clear 
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│              • VLESS PANEL MENU •               │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│   [01] • ADD VLESS      [04] • USER ONLINE      │"
echo -e "│   [02] • RENEW VLESS    [05] • CREATE TRIAL     │"
echo -e "│   [03] • DELETE VLESS   [00] • GO BACK          │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘" 
echo  -e  " " 
read  -p  "  Select menu :   "   opt 
echo  -e  " " 
case  $opt  in 
01 | 1) clear  ;  addvless ;; 
02 | 2) clear  ;  renewvless ;; 
03 | 3) clear  ;  delvless ;; 
04 | 4) clear  ;  cekvless ;; 
05 | 5) clear  ;  trialvless ;;
00 | 0) clear  ;  menu ;; 
* ) clear  ;  m-vless ;; 
esac 

       