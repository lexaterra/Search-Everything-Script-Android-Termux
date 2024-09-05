#!/bin/bash
#Author: Alex Terranova 2023
#TITLE: Search All v3.0x auto

response=''
RED='\e[38;5;111m'
YEG='\e[38;5;190m'
REG='\033[0;0m'
DP='\e[38;5;162m'
TOT1=0
TOT2=0
TOTF1=0
TOTF2=0
while ! [[ $response = "q" ]]
do
TOT1=0
TOT2=0
TOTF1=0
TOTF2=0
echo ''
echo -e "\n\n${YEG}Find What?${REG}"
read -p '> ' response
echo ''
printf "\033c"
if [[ $response = "q" ]]; then
exit
fi


internalpath="/storage/emulated/0"

cd $internalpath
TOTF1=$(echo -e $(find . -type f 2>/dev/null | wc -l))

echo -e "${YEG}PATH ${REG}> ${RED}($internalpath) ${YEG}FIND ${REG}> ${RED}$response${REG}"
echo -e "\n\n"

InternalOut="$(find . -iname "*$response*" -fprint >(grep -i --color=always $response)   2>/dev/null | wc -l )"
TOT1=$(echo -e "${InternalOut//$'\n'/"\n\n"}")
InternalOut="$(find . -iname "*$response*" -fprint >(grep -i --color=always $response)   2>/dev/null)  "
echo -e "${InternalOut//$'\n'/"\n\n"}"
echo -e "\n\n${YEG}Found ${RED}$TOT1${REG}/${RED}$TOTF1\n\n\n--------------------"

cd ~/storage
string="$(ls -la -l 2>&1)"

if [[ "$string" == *"external-1"* ]]; then
 
searchstringbefore=$(ls -la | grep -m1 -oP '[A-Z0-9+\-]{9}' )

sdcardpath="/storage/$searchstringbefore"


echo -e "\n\n"
echo -e "${YEG}PATH ${REG}> ${RED}($sdcardpath) ${YEG}FIND ${REG}> ${RED}$response${REG}"
echo -e "\n\n"


cd $sdcardpath

#find . -type f -print -exec sh -c 'printf %c "$@" | wc -c' '' '{}' + # just print the numbers
#find . -type f -exec sh -c 'echo "Processed `printf %c "$@" | wc -c` items."' '' '{}' +
TOTF2=$(echo -e $(find . -type f 2>/dev/null | wc -l))
ExternalOut="$(find . -iname "*$response*" -fprint >(grep -i --color=always $response)  2>/dev/null  | wc -l )"
TOT2=$(echo -e "${ExternalOut//$'\n'/"\n\n${SDCARD}---${REG}\n\n"}")
ExternalOut="$(find . -iname "*$response*" -fprint >(grep -i --color=always $response)  2>/dev/null)"
echo -e "${ExternalOut//$'\n'/"\n\n"}"
echo -e "\n\n${YEG}Found ${RED}$TOT2${REG}/${RED}$TOTF2"
fi

done