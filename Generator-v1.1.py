# DEFAULT BITRATES ARE 2.5Mbps for video, and 256kbps for audio.
A = 128
V = 1000
R = 16
S = 9
k = 480
j = 720
# TITLE SEQUENCE IS HERE
print ("")
print ("PSP ffmpeg Encoder Script 1.1")
print ("By MaxSolar0713")
print ("")
# This part acquires the input and output locations of the file, so it can get the important stuff out of the way.
I = input("Please enter location of input file: ")
O = input("Please enter location of output file: ")
# Asks if you want to change bitrates.
M = input("Would you like to change advanced settings? [y/n] ")
if M == "y":
    br = input("Change bitrates? (y/n) ")
    if br == "y":
        A = input("What bitrate for audio? (kbps) ")
        V = input("What bitrate for video? (kbps) ")
    chg = input("Change aspect ratio? ")
    if chg == "y":
            R = input("Height of Aspect ratio? ")
            S = input("Length of Aspect Ratio? ")
    d = input("Change video dimensions? ")
    if d == "y":
        j = input("What length? ")
        k = input("What height? ")
# THIS IS WHERE THE COMMAND IS PUT OUT.
print ("")
print ("Here is your command!")
print ("")
print ("ffmpeg -i ",I," -vcodec libx264 -b:v ",V,"k -s ",j,"x",k," -aspect 16:9 -profile:v main -level:v 2.1 -x264-params ref=3:bframes=1 -acodec aac -b:a ",A,"k -ac 2 -movflags +faststart ",O, sep='')
print ("")
print ("Thank you.")
