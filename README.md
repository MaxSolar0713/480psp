
 __  __        _   __  __        __   _ _       ___       __      _ __              _ __  
|  \/  |    _ | |  \ \/ /       /"/  | | |     ( _ )     /  \    | '_ \    ___     | '_ \ 
| |\/| |   | || |   >  <       / /   |_  _|    / _ \    | () |   | .__/   (_-<     | .__/ 
|_|__|_|   _\__/   /_/\_\    _/_/_    _|_|_    \___/    _\__/    |_|__    /__/_    |_|__  
_|"""""| _|"""""| _|"""""| _|"""""| _|"""""| _|"""""| _|"""""| _|"""""| _|"""""| _|"""""| 
"`-0-0-' "`-0-0-' "`-0-0-' "`-0-0-' "`-0-0-' "`-0-0-' "`-0-0-' "`-0-0-' "`-0-0-' "`-0-0-' 

# 480psp / Max J's eXperiment

480psp (codenamed MJX indev) is a python script that generates ffmpeg commands that generate PSP-Playable mp4 files. I tested this with my PSP-3000, so I don't know
if any other psp models will work.

Audio default bitrate is 160kbps aac, equivalent to 192kbps mp3. I didn't include video bitrate because ffmpeg causes bloat when you manually set it.

I consider the core components complete, but they are probably still buggy. My dev friend ("ShockOS") is helping me out in that department to .sh the program.

If you run the .sh file in a bash terminal, it should directly run the conversion with ffmpeg. On the other hand, you will need to manually copy the python script's output and paste in terminal if you use the python version. 

I will also be including a build of any HandBrake presets that seem to work soon, as I have been fiddling with HandBrake and have had various successes; however, there's always some sort of aspect ratio
issue, so I would advise the python script first.

# Licensing:

THE ROOTBEER-WARE LICENSE" (Revision 42): <phk@FreeBSD.ORG> wrote this file. MaxSolar0713 Forked it.  As long as you retain this notice you
can do whatever you want with this stuff. If we meet some day, and you think this stuff is worth it, you can buy me a rootbeer or other soda in return.   Poul-Henning Kamp/MaxSolar0713
