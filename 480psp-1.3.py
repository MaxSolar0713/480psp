# DEFAULT BITRATES ARE 2.5Mbps for video, and 128kbps for audio.
Y = 0
A = 160
R = 16
S = 9
k = 480
j = 720
def vbitrate():
    global Y
    Y = 1
    global P
    P = input("What bitrate for video? (kbps): ")
def file_in():
    global I
    I = input("Please enter location of input file: ")
def file_out():
    global O
    O = input("Please enter location of output file: ")
def bitrate():
    global A
    A = input("What bitrate for audio? (kbps, default 160): ")
    if A == "":
        A = 160
def aspect():
    global R
    R = input("Length of Aspect ratio? (default 16): ")
    if R == "":
        R = 16
    global S
    S = input("Height of Aspect Ratio? (default 9): ")
    if S == "":
        S = 9
def viddim():
    global j
    j = input("What length? (default 720): ")
    if j == "":
        j = 720
    global k
    k = input("What height? (default 480): ")
    if k == "":
        k = 480
def help():
    print ("file_in(): changes file input")
    print ("file_out(): changes file output")
    print ("bitrate(): changes audio bitrate")
    print ("aspect(): changes aspect ratio")
    print ("viddim(): changes video dimensions")
    print ("vbitrate(): changes video bitrate")
    print ("create(): outputs the command")
def create():
    print ("")
    print ("Here is your command!")
    print ("")
    if Y == 1:
        print ("ffmpeg -i ",I," -vcodec libx264 -b:v ",P,"k -s ",j,"x",k," -aspect ",R,":",S," -profile:v main -level:v 2.1 -x264-params ref=3:bframes=1 -acodec aac -b:a ",A,"k -ac 2 -movflags +faststart ",O, sep='')
    else:
        print ("ffmpeg -i ",I," -vcodec libx264 -s ",j,"x",k," -aspect ",R,":",S," -profile:v main -level:v 2.1 -x264-params ref=3:bframes=1 -acodec aac -b:a ",A,"k -ac 2 -movflags +faststart ",O, sep='')
def run():
    global Y
    Y = 0
    global A
    A = 160
    global R
    R = 16
    global S
    S = 9
    global k
    k = 480
    global j
    j = 720
    global e
# TITLE SEQUENCE IS HERE
    print ("")
    print ("PSP ffmpeg Encoder Script 1.1")
    print ("By MaxSolar0713")
    print ("")
    # This part acquires the input and output locations of the file, so it can get the important stuff out of the way.
    file_in()
    file_out()
    e = input("Would you like to enter advanced mode? [y/N]: ")
    if e == "y":
        print ("")
        print ("Press Enter at any time to go with default bitrates.")
        print ("")
        bitrate()
        v_bit = input("Set video bitrate? (VBR by default) [y/N]: ")
        if v_bit == 'y':
            vbitrate()
        aspect()
        viddim()
    else:
        Z = input("Would you like to use a preset? [y/N]: ")
        if Z == "y":
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
                A = 128
                R = 4
                S = 3
                k = 240
                j = 320
# MOST COMMON 480p PRESET FOR PSP-3000
            if preset == "0":
                A = 256
                R = 16
                S = 9
                k = 480
                j = 720
            if preset == "1":
                A = 192
                R = 16
                S = 9
                k = 480
                j = 720
            if preset == "2":
                A = 160
                R = 16
                S = 9
                k = 480
                j = 720
            if preset == "3":
                A = 128
                R = 16
                S = 9
                k = 480
                j = 720
            if preset == "4":
                A = 256
                R = 4
                S = 3
                k = 480
                j = 640
            if preset == "5":
                A = 192
                R = 4
                S = 3
                k = 480
                j = 640
            if preset == "6":
                A = 160
                R = 4
                S = 3
                k = 480
                j = 640
            if preset == "7":
                A = 128
                R = 4
                S = 3
                k = 480
                j = 640
# MOST COMMONLY COMPATIBLE VIDEO FORMAT FOR PSP
            if preset == "8":
                A = 256
                R = 16
                S = 9
                k = 272
                j = 480
            if preset == "9":
                A = 192
                R = 16
                S = 9
                k = 272
                j = 480
            if preset == "A":
                A = 160
                R = 16
                S = 9
                k = 272
                j = 480
            if preset == "B":
                A = 128
                R = 16
                S = 9
                k = 272
                j = 480
# 320 x 240 is most likely to work on PSP-1000
            if preset == "C":
                A = 256
                R = 4
                S = 3
                k = 240
                j = 320
            if preset == "D":
                A = 192
                R = 4
                S = 3
                k = 240
                j = 320
            if preset == "E":
                A = 160
                R = 4
                S = 3
                k = 240
                j = 320
    # THIS IS WHERE THE COMMAND IS PUT OUT.
    create()
    print ("")
    print ("To change part of the command, type help() for a list of commands, and use the commands thereof.")
    print ("Type run() to run this program again.")
    print ("Thank you.")
run()
