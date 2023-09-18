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


internalpath="/storage/emulated/0"

cd $internalpath

echo ''
echo -e "${INT}PATH > ($internalpath) FIND > $response${REG}"
echo ''

InternalOut="$(find . -iname "*$response*" 2>/dev/null)"
echo -e "${InternalOut//$'\n'/"\n\n${INT}---${REG}\n\n"}"


cd ~/storage
string="$(ls -la -l 2>&1)"

if [[ "$string" == *"external-1"* ]]; then
 
searchstringbefore="/Android/"
searchstringafter="external-1 -> /storage/"

temp=${string%$searchstringbefore*} 
temp2=${temp#*$searchstringafter}

sdcardpath="/storage/$temp2"

#cd ~/storage
#ls -la

echo ''
echo -e "${SDCARD}PATH > ($sdcardpath) FIND > $response${REG}"
echo ''

cd $sdcardpath
ExternalOut="$(find . -iname "*$response*" 2>/dev/null)"
echo -e "${ExternalOut//$'\n'/"\n\n${SDCARD}---${REG}\n\n"}"
fi

done