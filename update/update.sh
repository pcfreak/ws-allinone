#!/bin/bash
#Script Auto Reboot Vps
#wget https://github.com/${GitUser}/
GitUser="pcfreak"
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
# Valid Script
VALIDITY () {
    today=`date -d "0 days" +"%Y-%m-%d"`
    Exp1=$(curl https://raw.githubusercontent.com/pcfreak/allow/main/ipvps.conf | grep $MYIP | awk '{print $4}')
    if [[ $today < $Exp1 ]]; then
    echo -e "\e[32mYOUR SCRIPT ACTIVE..\e[0m"
    else
    echo -e "\e[31mYOUR SCRIPT HAS EXPIRED!\e[0m";
    echo -e "\e[31mPlease renew your ipvps first\e[0m"
    exit 0
fi
}
IZIN=$(curl https://raw.githubusercontent.com/pcfreak/allow/main/ipvps.conf | awk '{print $5}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo -e "\e[32mPermission Accepted...\e[0m"
VALIDITY
else
echo -e "\e[31mPermission Denied!\e[0m";
echo -e "\e[31mPlease buy script first\e[0m"
exit 0
fi
clear
RED='\e[1;31m'
GREEN='\e[0;32m'
BLUE='\e[0;34m'
NC='\e[0m'
version=$(cat /home/ver)
ver=$( curl https://raw.githubusercontent.com/${GitUser}/version-m/main/version.conf )
clear
# CEK UPDATE
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info1="${Green_font_prefix}[$version]${Font_color_suffix}"
Info2="${Green_font_prefix}[LATEST VERSION]${Font_color_suffix}"
Error="Version ${Green_font_prefix}[$ver]${Font_color_suffix} available${Red_font_prefix}[Please Update]${Font_color_suffix}"
version=$(cat /home/ver)
new_version=$( curl https://raw.githubusercontent.com/${GitUser}/version-m/main/version.conf | grep $version )
#Status Version
if [ $version = $new_version ]; then
sts="${Info2}"
else
sts="${Error}"
fi
clear

# Echo Shell
echo ""
echo ""
echo -e "  .-------------------------------------------------------." | lolcat
echo -e "  |                    UPDATE SCRIPT MENU                 |" | lolcat
echo -e "  '-------------------------------------------------------'" | lolcat
echo -e "  \e[0;36mVERSION NOW \e[0;33m>>\e[0m $Info1"
echo -e "  \e[0;36mSTATUS UPDATE \e[0;33m>>\e[0m $sts"
echo -e ""
echo -e "     \e[0;36m1.\e[0m Change Banner SSH"
echo -e "     \e[0;36m2.\e[0m Check Update/New Version Script"
echo ""
echo -e "  --------------------------------------------------------" | lolcat
echo -e "    \e[0;32m[x]\e[0m  Back To Main Menu"
echo -e ""
read -p "     Select From Options [1-3 or x] :  " port
echo -e ""
case $port in
1)
message-ssh
;;
2)
run-update
;;
x)
clear
menu
;;
*)
clear
echo -e "\e[1;31mPlease enter an correct number, Try again.\e[0m"
sleep 2
update
;;
esac
