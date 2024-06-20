#!/bin/bash

y=0

a=128

r=16

s=9

k=480

j=720

function whiptail() { whiptail --backtitle="PSP ffmpeg Encoder Script 1.2" $@; }

function vbitrate() { y=1; p="$(whiptail --inputbox --title="Configure Video Bitrate" "What bitrate for video? (kbps)" 10 50)"; }

function file_in() {

local success="FALSE"

until [[ "$success" == "TRUE" ]]
do

    i="$(whiptail --title="Input File" --inputbox "Please enter the location of the input file:" 10 50)"

    if [[ "$i" == "~/"* ]]
    then

        i="${i:2}"

        i="/home/$(whoami)/${i}"

    fi

    if [[ ! -f "$i" ]]
    then

        echo "ERROR: '$i': No such file. Please choose a video file that actually exists."

        whiptail --title="ERROR" --ok-button="Retry" --msgbox "'$i': No such file. Please choose a video file that actually exists." 10 50

    elif [[ "$(file -b --mime-type "$i")" != "video/"* ]]
    then

        echo "ERROR: '$i' does not seem to be a valid video file."

        whiptail --title="ERROR" --ok-button="Retry" --msgbox "'$i' does not seem to be a valid video file." 10 50

    else

        local success="TRUE"

    fi

done

}

function file_out() {

local success="FALSE"

until [[ "$success" == "TRUE" ]]
do

    o="$(whiptail --title="Output File" --inputbox "Please enter the location of the ouput file:" 10 50)"

    if [[ "$o" == "~/"* ]]
    then

        o="${o:2}"

        o="/home/$(whoami)/${o}"

    fi

    if [[ ! -d "$(dirname "$o")" ]]
    then

        echo "ERROR: '$(dirname "$o")': No such directory exists. Please choose a directory that exists."

        whiptail --title="ERROR" --ok-button="Retry" --msgbox "'$(dirname "$o")': No such directory exists. Please choose a directory that exists." 10 50

    elif [[ -f "$o" ]]
    then

        echo "ERROR: '$o': File already exists. Please choose a different filename."

        whiptail --title="ERROR" --ok-button="Retry" --msgbox "'$o': File already exists. Please choose a different filename." 10 50

    else

        local success="TRUE"

    fi

done

}

function bitrate() { a="$(whiptail --title="Configure Audio Bitrate" --inputbox "What bitrate for audio? (kbps):" 10 50 "$a")"; }

function aspect() { r="$(whiptail --title="Configure Aspect Ratio" --inputbox "Height of aspect ratio?:" 10 50 "$r")"; s="$(whiptail --title="Configure Aspect Ratio" --inputbox "Height of aspect ratio?:" 10 50 "$s")"; }

function viddim() { j="$(whiptail --title="Configure Video Dimensions" --inputbox "What length?:" 10 50 "$j")"; k="$(whiptail --title="Configure Video Dimensions" --inputbox "What height?:" 10 50 "$k")"; }

function show_help() {

echo "file_in: changes file input
file_out: changes file output
bitrate: changes audio bitrate
aspect: changes aspect ratio
viddim: changes video dimensions
vbitrate: changes video bitrate
create: outputs the command"

}

function create() {

    if [[ "$y" == "1" ]]
    then

        cmd="ffmpeg -i ${i} -vcodec libx264 -b:v ${p}k -s ${j}x${k} -aspect 16:9 -profile:v main -level:v 2.1 -x264-params ref=3:bframes=1 -acodec aac -b:a ${a}k -ac 2 -movflags +faststart ${o}"

    else

        cmd="ffmpeg -i ${i} -vcodec libx264 -s ${j}x${k} -aspect 16:9 -profile:v main -level:v 2.1 -x264-params ref=3:bframes=1 -acodec aac -b:a ${a}k -ac 2 -movflags +faststart ${o}"

    fi

    whiptail --title="Command Generated" --yesno "Here is your command:

$cmd

Would you like to run this command now?" 10 50

    ex=$?

    if [[ "$ex" == "0" ]]
    then

        echo "RUNNING COMMAND..."

        eval "$cmd"

    fi

}

echo "
PSP ffmpeg Encoder Script 1.2
Original Python Script by MaxSolar0713
Translated into Bash by Carson G From JPT
"

if [[ "$1" == "help" ]] || [[ "$1" == "--help" ]]
then

    show_help

else

    file_in

    file_out

    read -p "Would you like to change advanced settings? [y/N]: " m

    if [[ "$m" == "Y" ]] || [[ "$m" == "y" ]]
    then

        read -p "Change audio bitrates? [y/N]: " br

        if [[ "$br" == "Y" ]] || [[ "$br" == "y" ]]
        then

            bitrate

        fi

        read -p "Change video bitrates? [y/N]: " vbr

        if [[ "$vbr" == "Y" ]] || [[ "$vbr" == "y" ]]
        then

            vbitrate

        fi

        read -p "Change aspect ratio? [y/N]: " chg

        if [[ "$chg" == "Y" ]] || [[ "$chg" == "y" ]]
        then

            aspect

        fi

        read -p "Change video dimensions? [y/N]: " d

        if [[ "$d" == "Y" ]] || [[ "$d" == "y" ]]
        then

            viddim

        fi

    fi

    create

    echo "
    To change part of the command, type 'help' for a list of commands, and use the commands thereof.
    Thank you."

fi


