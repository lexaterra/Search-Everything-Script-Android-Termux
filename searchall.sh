#!/bin/bash
#Author: Alex Terranova 2023
#TITLE: Search All
# AT Widget
response=''
INT='\033[0;31m'
SDCARD='\033[0;32m'
REG='\033[0;0m'
printf "\033c"

while ! [[ $response = "q" ]]
do

echo ''
read -p 'Find What? ' response
echo ''

if [[ $response = "q" ]]; then
exit
fi

echo -e "${INT}INTERNAL${REG}"
cd '/storage/emulated/0/'
find . -iname "*$response*" 2>/dev/null
#replace 668B-CC32 with the name of your sdcard
echo -e "${SDCARD}EXTERNAL${REG}"
cd '/storage/668B-CC32/'
find . -iname "*$response*" 2>/dev/null

done