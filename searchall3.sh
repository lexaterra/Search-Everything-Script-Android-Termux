#!/bin/bash
#Author: Alex Terranova 2023
#TITLE: Search All v3.0x auto

response=''
INT='\033[0;31m'
SDCARD='\033[0;32m'
REG='\033[0;0m'
Cyan='\033[0;36m'

while ! [[ $response = "q" ]]
do

echo ''
echo -e "${Cyan}Find What?${REG}"
read -p '> ' response
echo ''
printf "\033c"
if [[ $response = "q" ]]; then
exit
fi
echo ''
echo -e "${INT}INTERNAL > $response${REG}"
echo ''
cd '/storage/emulated/0/'
InternalOut="$(find . -iname "*$response*" 2>/dev/null)"
echo -e "${InternalOut//$'\n'/"\n\n${INT}---${REG}\n\n"}"


echo ''
echo -e "${SDCARD}EXTERNAL > $response${REG}"
echo ''

cd ~/storage
string="$(ls -la -l 2>&1)"

searchstringbefore="/Android/"
searchstringafter="external-1 -> /storage/"

temp=${string%$searchstringbefore*} 
temp2=${temp#*$searchstringafter}

sdcardpath="/storage/$temp2"

#cd ~/storage
#ls -la

cd $sdcardpath
ExternalOut="$(find . -iname "*$response*" 2>/dev/null)"
echo -e "${ExternalOut//$'\n'/"\n\n${SDCARD}---${REG}\n\n"}"
done