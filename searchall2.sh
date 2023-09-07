#!/bin/bash
#Author: Alex Terranova 2023
#TITLE: Search All v2.0x auto
# AT Widget
response=''
INT='\033[0;31m'
SDCARD='\033[0;32m'
REG='\033[0;0m'


while ! [[ $response = "q" ]]
do

echo ''
read -p 'Find What? ' response
echo ''
printf "\033c"
if [[ $response = "q" ]]; then
exit
fi
echo ''
echo -e "${INT}INTERNAL > $response${REG}"
echo ''
cd '/storage/emulated/0/'
find . -iname "*$response*" 2>/dev/null
#replace 668B-CC32 with the name of your sdcard
echo ''
echo -e "${SDCARD}EXTERNAL > $response${REG}"
echo ''

cd ~/storage
#player_status="$(playerctl -l 2>&1)"
string="$(ls -la -l 2>&1)"

searchstringbefore="/Android/"
searchstringafter="external-1 -> /storage/"

temp=${string%$searchstringbefore*} 
temp2=${temp#*$searchstringafter}

sdcardpath="/storage/$temp2"

#cd ~/storage
#ls -la

cd $sdcardpath
find . -iname "*$response*" 2>/dev/null

done