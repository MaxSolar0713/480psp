# 480psp / Max J's eXperiment

480psp (codenamed MJX indev) is a python script that generates ffmpeg commands that generate PSP-Playable mp4 files. I tested this with my PSP-3000, so I don't know
if any other psp models will work.

Audio default bitrate is 128kbps. I didn't include video bitrate because ffmpeg causes bloat when you manually set it.

I consider the core components complete, but they are probably still buggy and injection isn't done at all; I expect to have a dev friend help me out in that department (probably to .sh it.)

I will also be including a build of any HandBrake presets that seem to work, as I have been fiddling with HandBrake and have had various successes; however, there's always some sort of aspect ratio
issue, so I would advise the python script first.
