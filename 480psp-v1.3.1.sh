#!/bin/bash

# DEFAULT VALUES FOR THE VARIABLES USED ARE STORED HERE. Y enables the Video
# bitrate option, A is the Audio Bitrate (AAC), R and S are Length:Height of
# Aspect ratio, J and K are the dimensions of the actual video.

y=0
a=128
r=16
s=9
k=480
j=720

# Video bitrate change function
function vbitrate() { y=1; read -p "What bitrate for video? (kbps): " p; }

# Video File command input located here.
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

# Output file path command located here.
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

# Audio bitrate function located here.
function bitrate() {

    read -p "What bitrate for audio? (kbps): " a

    if [[ -z "$a" ]]
    then

        a=160

    fi

}

# Aspect Ratio command located here.
function aspect() {

    read -p "Height of Aspect ratio?: " r

    if [[ -z "$r" ]]
    then

        r=16

    fi

    read -p "Lenght of Aspect ratio?: " s

    if [[ -z "$s" ]]
    then

        s=9

    fi

}

# Video dimension command located here.
function viddim() {

    read -p "What length?: " j

    if [[ -z "$j" ]]
    then

        j=720

    fi

    read -p "What height?: " k

    if [[ -z "$k" ]]
    then

        k=480

    fi

}

# Help command located here for post-generation modification.
function show_help() {

echo "file_in: changes file input
file_out: changes file output
bitrate: changes audio bitrate
aspect: changes aspect ratio
viddim: changes video dimensions
vbitrate: changes video bitrate
create: outputs the command"

}

# Function that creates the command.
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

# THE SCRIPT BEGINS HERE: This is the equivalent of the 'run' function in the Python script, but this code is not inside a function because that is unecessary.

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

    read -p "Would you like to enter advanced mode? [y/N]: " e

    if [[ "$e" == "Y" ]] || [[ "$e" == "y" ]]
    then

        echo ""

        echo "Press ENTER at any time to go with default values."

        echo ""

        bitrate

        read -p "Set video bitrate? (VBR by default) [y/N]: " v_bit

        if [[ "$v_bit" == "Y" ]] || [[ "$v_bit" == "y" ]]
        then

            vbitrate

        fi

        aspect

        viddim

    else

        read -p "Would you like to use a preset? [y/N]: " z

        if [[ "$z" == "Y" ]] || [[ "$z" == "y" ]]
        then

            # Presets here have various audio bitrates for the sake of file size.
            # Various resolutions are included also to account for functional PSP
            # playback. 16:9 and 4:3 ratios have been included.

            echo "Preset #, Resolution, Ratio, Audio"
            echo "or"
            echo "Standard, Audio"
            echo ""
            echo "0: PSP-3000 480p, 256kbps"
            echo "1: 720x480, 16:9, 192kbps"
            echo "2: 720x480, 16:9, 160kbps"
            echo "3: 720x480, 16:9, 128kbps"
            echo "4: 4:3 for PSP-3000, 256kbps"
            echo "5: 640x480, 4:3, 192kbps"
            echo "6: 640x480, 4:3, 160kbps"
            echo "7: 640x480, 4:3, 128kbps"
            echo "8: Most Compatible with PSP, 256kbps"
            echo "9: 480x272, 16:9, 192kbps"
            echo "A: 480x272, 16:9, 160kbps"
            echo "B: 480x272, 16:9, 128kbps"
            echo "C: Most PSP-1000 Compatible, 256kbps"
            echo "D: 320x240, 4:3, 192kbps"
            echo "E: 320x240, 4:3, 160kbps"
            echo "F: 320x240, 4:3, 128kbps"
            echo ""

            read -p "Enter the number/letter of the preset you wish to use: " preset

            if [[ "$preset" == "F" ]] || [[ "$preset" == "f" ]]
            then

                a=128
                r=4
                s=3
                k=240
                j=320

            elif [[ "$preset" == "0" ]]
            then

                a=256
                r=16
                s=9
                k=480
                j=720

            elif [[ "$preset" == "1" ]]
            then

                a=192
                r=16
                s=9
                k=480
                j=720

            elif [[ "$preset" == "2" ]]
            then

                a=160
                r=16
                s=9
                k=480
                j=720

            elif [[ "$preset" == "3" ]]
            then

                a=128
                r=16
                s=9
                k=480
                j=720

            elif [[ "$preset" == "4" ]]
            then

                a=256
                r=4
                s=3
                k=480
                j=640

            elif [[ "$preset" == "5" ]]
            then

                a=192
                r=4
                s=3
                k=480
                j=640

            elif [[ "$preset" == "6" ]]
            then

                a=160
                r=4
                s=3
                k=480
                j=640

            elif [[ "$preset" == "7" ]]
            then

                a=128
                r=4
                s=3
                k=480
                j=640

            # MOST COMMONLY COMPATIBLE VIDEO FORMAT FOR PSP
            elif [[ "$preset" == "8" ]]
            then

                a=256
                r=16
                s=9
                k=272
                j=480

            elif [[ "$preset" == "9" ]]
            then

                a=192
                r=16
                s=9
                k=272
                j=480

            elif [[ "$preset" == "A" ]] || [[ "$preset" == "a" ]]
            then

                a=160
                r=16
                s=9
                k=272
                j=480

            elif [[ "$preset" == "B" ]] || [[ "$preset" == "b" ]]
            then

                a=128
                r=16
                s=9
                k=272
                j=480

            # 320 x 240 is most likely to work on PSP-1000
            elif [[ "$preset" == "C" ]] || [[ "$preset" == "c" ]]
            then

                a=256
                r=4
                s=3
                k=240
                j=320

            elif [[ "$preset" == "D" ]] || [[ "$preset" == "d" ]]
            then

                a=192
                r=4
                s=3
                k=240
                j=320

            elif [[ "$preset" == "E" ]] || [[ "$preset" == "e" ]]
            then

                a=160
                r=4
                s=3
                k=240
                j=320

            fi

        fi

    fi

    create

    echo "
    To change part of the command, type 'help' for a list of commands, and use the commands thereof.
    Thank you."

fi


