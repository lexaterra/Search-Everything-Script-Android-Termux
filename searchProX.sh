#!/bin/bash
#Author: Alex Terranova 2024
#TITLE: Search All Android Termux
response=''
RED='\e[38;5;111m'
YEG='\e[38;5;190m'
REG='\033[0;0m'
DP='\e[38;5;162m'
pictures=0
normal=0
videos=0
documents=0
music=0
executables=0
archives=0
while ! [[ $response = "q" ]]
do
pictures=0
normal=0
videos=0
documents=0
executables=0
music=0
archives=0
echo -e "\n\nq='quit'"
echo -e "s='termux-setup-storage'"
echo -e "n='Normal'"
echo -e "p='Pictures'"
echo -e "m='Music'"
echo -e "v='Videos'"
echo -e "d='Documents'"
echo -e "e='Executables'"
echo -e "a='Archives'"
echo -e "\n${YEG}What type of Search?${REG}"
read -p '> ' response
echo ''
printf "\033c"
if [[ $response = "q" ]]; then
exit
fi
if [[ $response = "s" ]]; then
termux-setup-storage
exit
fi
if [[ $response = "p" ]]; then
pictures=1
normal=0
videos=0
documents=0
music=0
executables=0
archives=0
fi
if [[ $response = "n" ]]; then
pictures=0
normal=1
videos=0
documents=0
music=0
executables=0
archives=0
fi
if [[ $response = "d" ]]; then
pictures=0
normal=0
videos=0
documents=1
music=0
executables=0
archives=0
fi
if [[ $response = "v" ]]; then
pictures=0
normal=0
videos=1
documents=0
music=0
executables=0
archives=0
fi
if [[ $response = "m" ]]; then
pictures=0
normal=0
videos=0
documents=0
music=1
executables=0
archives=0
fi
if [[ $response = "e" ]]; then
pictures=0
normal=0
videos=0
documents=0
music=0
executables=1
archives=0
fi
if [[ $response = "a" ]]; then
pictures=0
normal=0
videos=0
documents=0
music=0
executables=0
archives=1
fi

echo -e "\n${YEG}Find What?${REG}"
read -p '> ' response
echo ''
printf "\033c"

START_TIME=$SECONDS


function start_spinner {
    set +m
    echo -n "$1"
    { while : ; do for X in 'Searching     ' 'Searching.    ' 'Searching..   ' 'Searching...  ' 'Searching.... ' 'Searching.....'; do echo -en "\r$X" ; sleep 0.1 ; done ; done & } 2>/dev/null



spinner_pid=$!
}

function stop_spinner {
    { kill -9 $spinner_pid && wait; } 2>/dev/null
    set -m
    echo -en "\033[2K\r"
}

spinner_pid=
start_spinner ""


cd ~/storage
string="$(ls -la -l 2>&1)"
if [[ "$string" == *"external-1"* ]]; then
searchstringbefore=$(ls -la | grep -m1 -oP '[A-Z0-9+\-]{9}' )
sdcardpath="/storage/$searchstringbefore"
internalpath="/storage/emulated/0"

if [ $normal = 1 ]; then
ExternalOut=$(find $sdcardpath -type f -iname "*$response*" -fprint >(grep -i --color=always $response) 2>/dev/null)
InternalOut=$(find $internalpath -type f -iname "*$response*" -fprint >(grep -i --color=always $response) 2>/dev/null)
fi
if [ $music = 1 ]; then
ExternalOut=$(find $sdcardpath -type f \( -iname "*$response*".mp3 -o -iname "*$response*".flac -o -iname "*$response*".ape -o -iname "*$response*".ogg -o -iname "*$response*".alac -o -iname "*$response*".dsf  -o -iname "*$response*".wav -o -iname "*$response*".ac3 -o -iname "*$response*".dsd  \) -fprint >(grep -i --color=always $response) 2>/dev/null)
InternalOut=$(find $internalpath -type f \( -iname "*$response*".mp3 -o -iname "*$response*".flac -o -iname "*$response*".ape -o -iname "*$response*".ogg -o -iname "*$response*".alac -o -iname "*$response*".dsf  -o -iname "*$response*".wav -o -iname "*$response*".ac3 -o -iname "*$response*".dsd  \) -fprint >(grep -i --color=always $response) 2>/dev/null)
fi
if [ $pictures = 1 ]; then
ExternalOut=$(find $sdcardpath -type f \( -iname "*$response*".jpg -o -iname "*$response*".png -o -iname "*$response*".gif -o -iname "*$response*".dng -o -iname "*$response*".jpeg -o -iname "*$response*".svg  -o -iname "*$response*".heic -o -iname "*$response*".bmp -o -iname "*$response*".raw  \) -fprint >(grep -i --color=always $response) 2>/dev/null)
InternalOut=$(find $internalpath -type f \( -iname "*$response*".jpg -o -iname "*$response*".png -o -iname "*$response*".gif -o -iname "*$response*".dng -o -iname "*$response*".jpeg -o -iname "*$response*".svg  -o -iname "*$response*".heic -o -iname "*$response*".bmp -o -iname "*$response*".raw  \) -fprint >(grep -i --color=always $response) 2>/dev/null)
fi
if [ $documents = 1 ]; then
ExternalOut=$(find $sdcardpath -type f \( -iname "*$response*".txt -o -iname "*$response*".md -o -iname "*$response*".rtf -o -iname "*$response*".doc -o -iname "*$response*".docx -o -iname "*$response*".ppt  -o -iname "*$response*".odt -o -iname "*$response*".xls -o -iname "*$response*".html   -o -iname "*$response*".pdf   -o -iname "*$response*".epub -o -iname "*$response*".cbr  -o -iname "*$response*".cbz   \) -fprint >(grep -i --color=always $response) 2>/dev/null)
InternalOut=$(find $internalpath -type f \( -iname "*$response*".txt -o -iname "*$response*".md -o -iname "*$response*".rtf -o -iname "*$response*".doc -o -iname "*$response*".docx -o -iname "*$response*".ppt  -o -iname "*$response*".odt -o -iname "*$response*".xls -o -iname "*$response*".html   -o -iname "*$response*".pdf   -o -iname "*$response*".epub -o -iname "*$response*".cbr  -o -iname "*$response*".cbz   \) -fprint >(grep -i --color=always $response) 2>/dev/null)
fi
if [ $videos = 1 ]; then
ExternalOut=$(find $sdcardpath -type f \( -iname "*$response*".avi -o -iname "*$response*".mp4 -o -iname "*$response*".ts -o -iname "*$response*".mkv -o -iname "*$response*".mov -o -iname "*$response*".wmv  -o -iname "*$response*".m4v -o -iname "*$response*".vob  \) -fprint >(grep -i --color=always $response) 2>/dev/null)
InternalOut=$(find $internalpath -type f \( -iname "*$response*".avi -o -iname "*$response*".mp4 -o -iname "*$response*".ts -o -iname "*$response*".mkv -o -iname "*$response*".mov -o -iname "*$response*".wmv  -o -iname "*$response*".m4v -o -iname "*$response*".vob  \) -fprint >(grep -i --color=always $response) 2>/dev/null)
fi
if [ $executables = 1 ]; then
ExternalOut=$(find $sdcardpath -type f \( -iname "*$response*".apk -o -iname "*$response*".apks -o -iname "*$response*".xapk -o -iname "*$response*".exe -o -iname "*$response*".msi -o -iname "*$response*".sh  -o -iname "*$response*".deb -o -iname "*$response*".appimage  \) -fprint >(grep -i --color=always $response) 2>/dev/null)
InternalOut=$(find $internalpath -type f \( -iname "*$response*".apk -o -iname "*$response*".apks -o -iname "*$response*".xapk -o -iname "*$response*".exe -o -iname "*$response*".msi -o -iname "*$response*".sh  -o -iname "*$response*".deb -o -iname "*$response*".appimage  \) -fprint >(grep -i --color=always $response) 2>/dev/null)
fi
if [ $archives = 1 ]; then
ExternalOut=$(find $sdcardpath -type f \( -iname "*$response*".rar -o -iname "*$response*".7z -o -iname "*$response*".zip -o -iname "*$response*".tar -o -iname "*$response*".tar.gz -o -iname "*$response*".zstd \) -fprint >(grep -i --color=always $response) 2>/dev/null)
InternalOut=$(find $internalpath -type f \( -iname "*$response*".rar -o -iname "*$response*".7z -o -iname "*$response*".zip -o -iname "*$response*".tar -o -iname "*$response*".tar.gz -o -iname "*$response*".zstd \) -fprint >(grep -i --color=always $response) 2>/dev/null)
fi

#

stop_spinner

echo -e "\e[38;5;160m   ____ __      ____         __       "
echo -e "\e[38;5;161m  / _(_) /__   / _(_)__  ___/ /__ ____"
echo -e "\e[38;5;162m / _/ / / -_) / _/ / _ \/ _  / -_) __/"
echo -e "\e[38;5;163m/_//_/_/\__/ /_//_/_//_/\_,_/\__/_/  "

echo -e "\t${YEG}Previous Search ${REG}> ${REG}$response${REG}\n\n"
echo -e "${InternalOut}\n\n" 
echo -e "${ExternalOut}\n\n"
ELAPSED_TIME=$(($SECONDS - $START_TIME))
echo -e "Time taken: ${ELAPSED_TIME} Seconds"

#printf '%.s─' $(seq 1 $(tput cols)) 

fi
done