#!/bin/bash

y=0

a=128

r=16

s=9

k=480

j=720

function vbitrate() { y=1; read -p "What bitrate for video? (kbps): " p; }

function file_in() { read -p "Please enter location of input file: " i; }

function file_out() { read -p "Please enter location of output file: " o; }

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

        echo "ffmpeg -i ${i} -vcodec libx264 -b:v ${p}k -s ${j}x${k} -aspect 16:9 -profile:v main -level:v 2.1 -x264-params ref=3:bframes=1 -acodec aac -b:a ${a}k -ac 2 -movflags +faststart ${o} sep=''"

    else

        echo "ffmpeg -i ${i} -vcodec libx264 -s ${j}x${k} -aspect 16:9 -profile:v main -level:v 2.1 -x264-params ref=3:bframes=1 -acodec aac -b:a ${a}k -ac 2 -movflags +faststart ${o} sep=''"

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


