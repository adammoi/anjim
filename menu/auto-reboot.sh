#!/bin/bash
function menu1(){
    clear
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│                 • AUTO REBOOT •                 │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e " ┌───────────────────────────────────────────────┐"
FILE=/etc/cron.d/re_otm
if [ -f "$FILE" ]; then
rm -f /etc/cron.d/re_otm
else 
re="ok"
fi
rm -f /etc/cron.d/auto_reboot
echo "*/30 * * * * root /usr/bin/rebootvps" > /etc/cron.d/auto_reboot && chmod +x /etc/cron.d/auto_reboot
echo -e " │ [INFO] Auto Reboot Active Successfully"
echo -e " │ [INFO] Auto Reboot : Every 30 Min"
echo -e " │ [INFO] Active & Running Automaticly"
echo -e " └───────────────────────────────────────────────┘"
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘" 
echo ""
read -n 1 -s -r -p "  Press any key to back on menu"
autoboot  
}
function menu2(){
        clear
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│                 • AUTO REBOOT •                 │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e " ┌───────────────────────────────────────────────┐"
FILE=/etc/cron.d/re_otm
if [ -f "$FILE" ]; then
rm -f /etc/cron.d/re_otm
else 
re="ok"
fi
rm -f /etc/cron.d/auto_reboot
echo "0 * * * * root /usr/bin/rebootvps" > /etc/cron.d/auto_reboot && chmod +x /etc/cron.d/auto_reboot
echo -e " │ [INFO] Auto Reboot Active Successfully        │"
echo -e " │ [INFO] Auto Reboot : Every 1 Hours            │"
echo -e " │ [INFO] Active & Running Automaticly           │"
echo -e " └───────────────────────────────────────────────┘"
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘" 
echo ""
read -n 1 -s -r -p "  Press any key to back on menu"
autoboot  
}
function menu3(){
        clear
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│                 • AUTO REBOOT •                 │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e " ┌───────────────────────────────────────────────┐"
FILE=/etc/cron.d/re_otm
if [ -f "$FILE" ]; then
rm -f /etc/cron.d/re_otm
else 
re="ok"
fi
rm -f /etc/cron.d/auto_reboot
echo "0 */12 * * * root /usr/bin/rebootvps" > /etc/cron.d/auto_reboot && chmod +x /etc/cron.d/auto_reboot
echo -e " │ [INFO] Auto Reboot Active Successfully        │"
echo -e " │ [INFO] Auto Reboot : Every 12 Hours           │"
echo -e " │ [INFO] Active & Running Automaticly           │"
echo -e " └───────────────────────────────────────────────┘"
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘" 
echo ""
read -n 1 -s -r -p "  Press any key to back on menu"
autoboot  
}
function menu4(){
        clear
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│                 • AUTO REBOOT •                 │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e " ┌───────────────────────────────────────────────┐"
FILE=/etc/cron.d/re_otm
if [ -f "$FILE" ]; then
rm -f /etc/cron.d/re_otm
else 
re="ok"
fi
rm -f /etc/cron.d/auto_reboot
echo "0 0 * * * root /usr/bin/rebootvps" > /etc/cron.d/auto_reboot && chmod +x /etc/cron.d/auto_reboot
echo -e " │ [INFO] Auto Reboot Active Successfully        │"
echo -e " │ [INFO] Auto Reboot : Every 24 Hours           │"
echo -e " │ [INFO] Active & Running Automaticly           │"
echo -e " └───────────────────────────────────────────────┘"
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘" 
echo ""
read -n 1 -s -r -p "  Press any key to back on menu"
auto-reboot  
}
clear
echo -e "┌─────────────────────────────────────────────────┐"
echo -e "│                 • AUTO REBOOT •                 │"
echo -e "└─────────────────────────────────────────────────┘"
echo -e " ┌───────────────────────────────────────────────┐"
echo -e " │   [01] • Every 30 Min  [03] • Every 12 H/s    │"
echo -e " │   [02] • Every 60 Min  [04] • Every 24 H/s    │"
echo -e " │                                               │"
echo -e " │   [00] • Go Back                              │"
echo -e " └───────────────────────────────────────────────┘"
echo -e "┌────────────────────── BY ───────────────────────┐"
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘" 
echo -e ""
read -p "  Select menu :  "  opt
echo -e ""
case $opt in
01 | 1) clear ; menu1 ;;
02 | 2) clear ; menu2 ;;
03 | 3) clear ; menu3 ;;
04 | 4) clear ; menu4 ;;
00 | 0) clear ; m-system ;;
*) clear ; m-system ;;
esac
