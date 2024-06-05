# 480psp / Max J's eXperiment

480psp (codenamed MJX indev) is a python script that generates ffmpeg commands that generate PSP-Playable mp4 files. I tested this with my PSP-3000, so I don't know
if any other psp models will work.

Audio default bitrate is 128kbps. I didn't include video bitrate because ffmpeg causes bloat when you manually set it.

I consider the core components complete, but they are probably still buggy and injection isn't done at all; I expect to have a dev friend help me out in that department (probably to .sh it.)

I will also be including a build of any HandBrake presets that seem to work, as I have been fiddling with HandBrake and have had various successes; however, there's always some sort of aspect ratio
issue, so I would advise the python script first.

*Update: While I do have a working HandBrake setting, it comes witg two problems: the main one is that can't export the preset. The other i discovered out of testing -- I made the mistake of using SuperFast 480p and modifying it to make it work. It will look fine on the PSP, but if you try to output it to a TV (which be honest is the main reason you're doing it) using the SuperFast base it looks... awful. I've never seen such a bad version of The Emperor's Club. I will be completely redoing it with HQ, but you can do it in HandBrake by setting main as profile and profile to 2.1... ill fix what i said when i get the chance.


THE ROOTBEER-WARE LICENSE" (Revision 42):
 * <phk@FreeBSD.ORG> wrote this file. MaxSolar0713 Forked it.  As long as you retain this notice you
 * can do whatever you want with this stuff. If we meet some day, and you think
 * this stuff is worth it, you can buy me a rootbeer or other soda in return.   Poul-Henning Kamp/MaxSolar0713
