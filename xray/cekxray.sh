#!/bin/bash
echo " "
if [ -e "/var/log/xray/access.log" ]; then
        LOG="/var/log/xray/access.log";
fi
if [ -e "/var/log/xray/error.log" ]; then
        LOG="/var/log/xray/error.log";
fi
#
if [ -f "/var/log/xray/access.log" ]; then
echo ""
anjay=$(netstat -anp | grep ESTABLISHED | grep xray | awk '{print $4,$5}' | sort | uniq);
rm -r /tmp/anjay-login.txt
clear
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "            ⇱ MENU CEK XRAY Login ⇲             "
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "            ⇱ XRAY Login ⇲             "
echo -e "  ⇱ Source IP Address  |  Destination IP/Website ⇲             "
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "----------------------------------------------";
        netstat -anp | grep ESTABLISHED | grep xray | awk '{print $4,$5}' | sort | uniq > /tmp/anjay-login.txt
        cat /tmp/anjay-login.txt
fi
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "            ⇱ XRAY Login ⇲             "
echo -e "  ⇱ Source IP Address  |  Destination IP/Website ⇲             "
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
#
if [ -f "/var/log/xray/access.log" ]; then
echo ""
rm -r /tmp/xray-login.txt
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "            ⇱ MENU CEK XRAY Info Live⇲             "
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "            ⇱ XRAY Info Live⇲             "
echo -e "  ⇱ Tahun/Bulan/Tanggal  |  Jam | IP Address Publik | Situs/IP Yang Di Buka⇲             "
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "----------------------------------------------";
        cat /var/log/xray/access.log | awk '{print $0}' | tail -n 500 | cut -d " " -f 1,2,3,5 | sort | uniq > /tmp/xray-login.txt
        cat /tmp/xray-login.txt
fi
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "            ⇱ XRAY Info Live⇲             "
echo -e "  ⇱ Tahun/Bulan/Tanggal  |  Jam | IP Address Publik| Situs/IP Yang Di Buka⇲             "
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "";
