Documentation of 480psp:

	HOW TO RUN IT:	
.sh FILE:
If you have the .sh file, you may run it in your Linux or Bash terminal.
The shell script should automagically port the command to the terminal for
processing.

.py FILE:
If you have the .py file, install Python 3.X or IDLE on your system. I used 
3.6.9 but I imagine that all python3 versions ought to work. (No, this will not 
work on Python 2.x, but it may be possible to port it over someday after I 
remove a billion parentheses. IDLE is ideal for nonlinux users.)
When you've installed Python3 or IDLE, run the command under python3 in 
terminal or start IDLE and open the 480psp.py file; once it loads press F5 or
go to Run>Run Module. From there, follow the instructions and eventually it 
will say "Here is your command!" You will see a command beginning with ffmpeg;
copy and paste that into terminal (provided ffmpeg is in path) and it should
start encoding your video!

HOW IT WORKS:
In its original python form, 480psp is merely a replacement command. It takes
an ffmpeg command that is sufficiently modified to suit the PSP's needs and
adds in some settings and the proper file location. The internal code structure
begins with commands and variables. The variable names are documented in the
code since version 1.3.1, and are as follows:

"Y enables the Video bitrate option, A is the Audio Bitrate (AAC), R and S are 
Length:Height of Aspect ratio, j and k are the dimensions of the actual video."

Also included are varables P (video bitrate, kbps), I (input path), O (output
path) and e (boolean determinant for enabling advanced mode.)

In a stripped down form, the command that ffmpeg produces would look something
like this: (THIS ISN'T IDENTICAL TO THE COMMAND.]

ffmpeg -i [INPUT FILE] -b:v [VIDEO BITRATE] -b:a [AUDIO BITRATE] [OTHER 
COMMAND MODIFIERS] -o [OUTPUT LOCATION]

However, [INPUT FILE] is replaced by function in the program, as are all of the
other variables in brackets. Eventually, if you fill all the holes in (which 
480psp helps you do) you will have a workable command.

WHY WRITE THIS PROGRAM:

For a long time, I spent hours at end trying to figure out how to convert an
mp4 file to a psp-usable mp4 file since the PSP has stricter playback 
requirements. I eventually found a semi-working command somewhere on the
web, and since I didn't want anyone else to have to waste time looking for this
command, I decided to make the generator.
