#!/bin/bash

y=0

a=128

r=16

s=9

k=480

j=720

function vbitrate() { y=1; read -p "What bitrate for video? (kbps): " p; }

function file_in() {

local success="FALSE"

until [[ "$success" == "TRUE" ]]
do

    read -p "Please enter location of input file: " i

    if [[ "$i" == "~/"* ]]
    then

        i="${i:2}"

        i="/home/$(whoami)/${i}"

    fi

    if [[ ! -f "$i" ]]
    then

        echo "ERROR: '$i': No such file. Please choose a video file that actually exists."

        echo ""

    elif [[ "$(file -b --mime-type "$i")" != "video/"* ]]
    then

        echo "ERROR: '$i' does not seem to be a valid video file."

        echo ""

    else

        local success="TRUE"

    fi

done

}

function file_out() {

local success="FALSE"

until [[ "$success" == "TRUE" ]]
do

    read -p "Please enter location of output file: " o

    if [[ "$o" == "~/"* ]]
    then

        o="${o:2}"

        o="/home/$(whoami)/${o}"

    fi

    if [[ ! -d "$(dirname "$o")" ]]
    then

        echo "ERROR: '$(dirname "$o")': No such directory exists. Please choose a directory that exists."

        echo ""

    elif [[ -f "$o" ]]
    then

        echo "ERROR: '$o': File already exists. Please choose a different filename."

        echo ""

    else

        local success="TRUE"

    fi

done

}

function bitrate() { read -p "What bitrate for audio? (kbps): " a; }

function aspect() { read -p "Height of Aspect ratio?: " r; read -p "Lenght of Aspect ratio?: " s; }

function viddim() { read -p "What length?: " j; read -p "What height?: " k; }

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

    echo ""

    echo "Here is your command!"

    echo ""

    if [[ "$y" == "1" ]]
    then

        cmd="ffmpeg -i ${i} -vcodec libx264 -b:v ${p}k -s ${j}x${k} -aspect 16:9 -profile:v main -level:v 2.1 -x264-params ref=3:bframes=1 -acodec aac -b:a ${a}k -ac 2 -movflags +faststart ${o}"

    else

        cmd="ffmpeg -i ${i} -vcodec libx264 -s ${j}x${k} -aspect 16:9 -profile:v main -level:v 2.1 -x264-params ref=3:bframes=1 -acodec aac -b:a ${a}k -ac 2 -movflags +faststart ${o}"

    fi

    echo "$cmd"

    echo ""

    read -p "Would you like to run this command now? [y/N]: " run_cmd_now

    if [[ "$run_cmd_now" == "Y" ]] || [[ "$run_cmd_now" == "y" ]]
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


