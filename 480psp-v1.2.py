# DEFAULT BITRATES ARE 2.5Mbps for video, and 128kbps for audio.
Y = 0
A = 128
R = 16
S = 9
k = 480
j = 720
def vbitrate():
    global Y
    Y = 1
    global P
    P = input("What bitrate for video? (kbps) ")
def file_in():
    global I
    I = input("Please enter location of input file: ")
def file_out():
    global O
    O = input("Please enter location of output file: ")
def bitrate():
    global A
    A = input("What bitrate for audio? (kbps) ")
def aspect():
    global R
    R = input("Height of Aspect ratio? ")
    global S
    S = input("Length of Aspect Ratio? ")
def viddim():
    global j
    j = input("What length? ")
    global k
    k = input("What height? ")
def help():
    print ("file_in(): changes file input")
    print ("file_out(): changes file output")
    print ("bitrate(): changes audio bitrate")
    print ("aspect(): changes aspect ratio")
    print ("viddim(): changes video dimensions")
    print ("vbitrate(): changes the video bitrate")
    print ("create(): outputs the command.")
def create():
    print ("")
    print ("Here is your command!")
    print ("")
    if Y == 1:
        print ("ffmpeg -i ",I," -vcodec libx264 -b:v ",P,"k -s ",j,"x",k," -aspect 16:9 -profile:v main -level:v 2.1 -x264-params ref=3:bframes=1 -acodec aac -b:a ",A,"k -ac 2 -movflags +faststart ",O, sep='')
    else:
        print ("ffmpeg -i ",I," -vcodec libx264 -s ",j,"x",k," -aspect 16:9 -profile:v main -level:v 2.1 -x264-params ref=3:bframes=1 -acodec aac -b:a ",A,"k -ac 2 -movflags +faststart ",O, sep='')
def run():
    global Y
    Y = 0
    global A
    A = 128
    global R
    R = 16
    global S
    S = 9
    global k
    k = 480
    global j
    j = 720
# TITLE SEQUENCE IS HERE
    print ("")
    print ("PSP ffmpeg Encoder Script 1.1")
    print ("By MaxSolar0713")
    print ("")
    # This part acquires the input and output locations of the file, so it can get the important stuff out of the way.
    file_in()
    file_out()
    # Asks if you want to change bitrates.
    M = input("Would you like to change advanced settings? [y/n] ")
    if M == "y":
        br = input("Change audio bitrates? (y/n) ")
        if br == "y":
            bitrate()
        vbr = input("Change video bitrates? (y/n) ")
        if vbr == "y":
            vbitrate()
        chg = input("Change aspect ratio? ")
        if chg == "y":
            aspect()
        d = input("Change video dimensions? ")
        if d == "y":
            viddim()
    # THIS IS WHERE THE COMMAND IS PUT OUT.
    create()
    print ("")
    print ("To change part of the command, type help() for a list of commands, and use the commands thereof.")
    print ("Type run() to run this program again.")
    print ("Thank you.")
run()
