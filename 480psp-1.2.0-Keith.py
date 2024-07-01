def convertTuple(tup):
        # initialize an empty string
    str = ''
    for item in tup:
        str = str + item
    return str
# DEFAULT VALUES FOR THE VARIABLES USED ARE STORED HERE.
abr_enable = 0
audio_bitrate = 160
aspect_width = 16
aspect_height = 9
output_height = 480
output_width = 720
crf = 23
# Video bitrate change function
def vbitrate():
    global abr_enable
    abr_enable = 1
    global video_bitrate
    video_bitrate = input("What bitrate for video? (kbps): ")
def crf_set():
    global crf
    crf = input("Video Quality? (0-16 is lossless, 23 is default, 51 is very bad):  ")
    if crf == (""):
        crf = 23
# Video File command input located here.
def file_in():
    global file_input
    file_input = input("Please enter location of input file: ")
# Output file path command located here.
def file_out():
    global file_output
    file_output = input("Please enter location of output file: ")
# Audio bitrate function located here.
def bitrate():
    global audio_bitrate
    audio_bitrate = input("What bitrate for audio? (kbps, default 160): ")
    if audio_bitrate == "":
        audio_bitrate = 160
# Aspect Ratio command located here.
def aspect():
    global aspect_width
    aspect_width = input("Length of Aspect ratio? (default 16): ")
    if aspect_width == "":
        aspect_width = 16
    global aspect_height
    aspect_height = input("Height of Aspect Ratio? (default 9): ")
    if aspect_height == "":
        aspect_height = 9
# Video dimension command located here.
def viddim():
    global output_width
    output_width = input("What length? (default 720): ")
    if output_width == "":
        output_width = 720
    global output_height
    output_height = input("What height? (default 480): ")
    if output_height == "":
        output_height = 480
# Help command located here for post-generation modification.
def help():
    print ("file_in(): changes file input")
    print ("file_out(): changes file output")
    print ("bitrate(): changes audio bitrate")
    print ("aspect(): changes aspect ratio")
    print ("viddim(): changes video dimensions")
    print ("vbitrate(): changes video bitrate")
    print ("create(): outputs the command")
# ==============================COMMAND CREATION ==============================
def create():
    print ("")
    print ("Here is your command!")
    print ("")
    if abr_enable == 1:
        global pre_command
        pre_command = ("ffmpeg -i ",str(file_input)," -vcodec libx264 -crf ",str(crf)," -b:v ",str(video_bitrate),"k -s ",str(output_width),"x",str(output_height)," -aspect ",str(aspect_width),":",str(aspect_height)," -profile:v main -level:v 2.1 -x264-params ref=3:bframes=1 -acodec aac -b:a ",str(audio_bitrate),"k -ac 2 -movflags +faststart ",str(file_output))
        global post_command
        post_command = convertTuple(pre_command)
        print(post_command)
    else:
        pre_command = ("ffmpeg -i ",str(file_input)," -vcodec libx264 -crf ",str(crf)," -s ",str(output_width),"x",str(output_height)," -aspect ",str(aspect_width),":",str(aspect_height)," -profile:v main -level:v 2.1 -x264-params ref=3:bframes=1 -acodec aac -b:a ",str(audio_bitrate),"k -ac 2 -movflags +faststart ",str(file_output))
        post_command = convertTuple(pre_command)
        print(post_command)
# ==============================================================================
# This function contains the entirety of the command generation wizard.
def run():
    # Global Variables are used because Python hates constants.
    # This part of the program sets all values to their defaults.
    global abr_enable
    abr_enable = 0
    global audio_bitrate
    audio_bitrate = 160
    global aspect_width
    aspect_width = 16
    global aspect_height
    aspect_height = 9
    global output_height
    output_height = 480
    global output_width
    output_width = 720
    global adv_mode
# TITLE SEQUENCE IS HERE
    print ("")
    print ("PSP ffmpeg Encoder Script 1.2 'Keith'")
    print ("By MaxSolar0713")
    print ("")
    # This part acquires the input and output locations of the file, so it can get the important stuff out of the way.
    file_in()
    file_out()
    # Advanced mode for those who are more experienced.
    adv_mode = input("Would you like to enter advanced mode? [y/N]: ")
    if adv_mode == "y":
        print ("")
        print ("Press Enter at any time to go with default values.")
        print ("")
        crf_set()
        bitrate()
        abr_enable = input("Set video bitrate? (VBR by default) [y/N]: ")
        if abr_enable == 'y':
            vbitrate()
        aspect()
        viddim()
    else:
        preset_true = input("Would you like to use a preset? [y/N]: ")
        if preset_true == "y":
            # Presets here have various audio bitrates for the sake of file size.
            # Various resolutions are included also to account for functional PSP
            # playback. 16:9 and 4:3 ratios have been included.
            print ("Preset #, Resolution, Ratio, Audio")
            print ("or")
            print ("Standard, Audio")
            print ("")
            print ("0: PSP-3000 480p, 256kbps")
            print ("1: 720x480, 16:9, 192kbps")
            print ("2: 720x480, 16:9, 160kbps")
            print ("3: 720x480, 16:9, 128kbps")
            print ("4: 4:3 for PSP-3000, 256kbps")
            print ("5: 640x480, 4:3, 192kbps")
            print ("6: 640x480, 4:3, 160kbps")
            print ("7: 640x480, 4:3, 128kbps")
            print ("8: Most Compatible with PSP, 256kbps")
            print ("9: 480x272, 16:9, 192kbps")
            print ("A: 480x272, 16:9, 160kbps")
            print ("B: 480x272, 16:9, 128kbps")
            print ("C: Most PSP-1000 Compatible, 256kbps")
            print ("D: 320x240, 4:3, 192kbps")
            print ("E: 320x240, 4:3, 160kbps")
            print ("F: 320x240, 4:3, 128kbps")
            print ("")
            preset = input("Enter the number/letter of the preset you wish to use: ")
            if preset == "F":
                audio_bitrate = 128
                aspect_width = 4
                aspect_height = 3
                output_height = 240
                output_width = 320
# MOST COMMON 480p PRESET FOR PSP-3000
            if preset == "0":
                audio_bitrate = 256
                aspect_width = 16
                aspect_height = 9
                output_height = 480
                output_width = 720
            if preset == "1":
                audio_bitrate = 192
                aspect_width = 16
                aspect_height = 9
                output_height = 480
                output_width = 720
            if preset == "2":
                audio_bitrate = 160
                aspect_width = 16
                aspect_height = 9
                output_height = 480
                output_width = 720
            if preset == "3":
                audio_bitrate = 128
                aspect_width = 16
                aspect_height = 9
                output_height = 480
                output_width = 720
            if preset == "4":
                audio_bitrate = 256
                aspect_width = 4
                aspect_height = 3
                output_height = 480
                output_width = 640
            if preset == "5":
                audio_bitrate = 192
                aspect_width = 4
                aspect_height = 3
                output_height = 480
                output_width = 640
            if preset == "6":
                audio_bitrate = 160
                aspect_width = 4
                aspect_height = 3
                output_height = 480
                output_width = 640
            if preset == "7":
                audio_bitrate = 128
                aspect_width = 4
                aspect_height = 3
                output_height = 480
                output_width = 640
# MOST COMMONLY COMPATIBLE VIDEO FORMAT FOR PSP
            if preset == "8":
                audio_bitrate = 256
                aspect_width = 16
                aspect_height = 9
                output_height = 272
                output_width = 480
            if preset == "9":
                audio_bitrate = 192
                aspect_width = 16
                aspect_height = 9
                output_height = 272
                output_width = 480
            if preset == "A":
                audio_bitrate = 160
                aspect_width = 16
                aspect_height = 9
                output_height = 272
                output_width = 480
            if preset == "B":
                audio_bitrate = 128
                aspect_width = 16
                aspect_height = 9
                output_height = 272
                output_width = 480
# 320 x 240 is most likely to work on PSP-1000
            if preset == "C":
                audio_bitrate = 256
                aspect_width = 4
                aspect_height = 3
                output_height = 240
                output_width = 320
            if preset == "D":
                audio_bitrate = 192
                aspect_width = 4
                aspect_height = 3
                output_height = 240
                output_width = 320
            if preset == "E":
                audio_bitrate = 160
                aspect_width = 4
                aspect_height = 3
                output_height = 240
                output_width = 320
    # THIS IS WHERE THE COMMAND IS PUT OUT.
    create()
    print ("")
    print ("To change part of the command, type help() for a list of commands, and use the commands thereof.")
    print ("Type run() to run this program again.")
    print ("Thank you.")
# This "run()" function is actually where the whole code begins. This allows for
# repeated execution, and also points out errors in the code before commencing
# execution. 
run()
import os
import subprocess
command = post_command
subprocess.call(command,shell=True)
