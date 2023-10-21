print ("")
print ("PSP ffmpeg Encoder Script 1.0")
print ("By MaxSolar0713")
print ("")
I = input("Please enter location of input file: ")
O = input("Please enter location of output file: ")
M = input("Would you like to change advanced settings? [y/n] ")
if M == "y":
    A = input("What bitrate for audio? (kbps) ")
    V = input("What bitrate for video? (kbps) ")
else:
    A = 256
    V = 2500
print ("")
print ("Here is your command!")
print ("")
print ("ffmpeg -i ",I," -vcodec libx264 -b:v ",V," -s 720x480 -aspect 16:9 -profile:v main -level:v 2.1 -x264-params ref=3:bframes=1 -acodec aac -b:a ",A,"k -ac 2 -movflags +faststart ",O)
print ("")
print ("Thank you.")
    
