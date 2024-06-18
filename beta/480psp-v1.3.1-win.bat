@echo off

SET "y=0"
SET "a=128"
SET "r=16"
SET "s=9"
SET "k=480"
SET "j=720"
echo "
PSP ffmpeg Encoder Script 1.2
Original Python Script by MaxSolar0713
Translated into Bash by Carson G From JPT
"
IF [[ "%~1" == "help" "]]" || [[ "%~1" == "--help" "]]" (
  CALL :show_help
) ELSE (
  CALL :file_in
  CALL :file_out
  read "-p" "Would you like to enter advanced mode? [y/N]: " "e"
  IF [[ "%e%" == "Y" "]]" || [[ "%e%" == "y" "]]" (
    echo ""
    echo "Press ENTER at any time to go with default values."
    echo ""
    CALL :bitrate
    read "-p" "Set video bitrate? (VBR by default) [y/N]: " "v_bit"
    IF [[ "%v_bit%" == "Y" "]]" || [[ "%v_bit%" == "y" "]]" (
      CALL :vbitrate
    )
    CALL :aspect
    CALL :viddim
  ) ELSE (
    read "-p" "Would you like to use a preset? [y/N]: " "z"
    IF [[ "%z%" == "Y" "]]" || [[ "%z%" == "y" "]]" (
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
      read "-p" "Enter the number/letter of the preset you wish to use: " "preset"
      IF [[ "%preset%" == "F" "]]" || [[ "%preset%" == "f" "]]" (
        SET "a=128"
        SET "r=4"
        SET "s=3"
        SET "k=240"
        SET "j=320"
      ) ELSE (
        IF [[ "%preset%" == "0" "]]" (
          SET "a=256"
          SET "r=16"
          SET "s=9"
          SET "k=480"
          SET "j=720"
        ) ELSE (
          IF [[ "%preset%" == "1" "]]" (
            SET "a=192"
            SET "r=16"
            SET "s=9"
            SET "k=480"
            SET "j=720"
          ) ELSE (
            IF [[ "%preset%" == "2" "]]" (
              SET "a=160"
              SET "r=16"
              SET "s=9"
              SET "k=480"
              SET "j=720"
            ) ELSE (
              IF [[ "%preset%" == "3" "]]" (
                SET "a=128"
                SET "r=16"
                SET "s=9"
                SET "k=480"
                SET "j=720"
              ) ELSE (
                IF [[ "%preset%" == "4" "]]" (
                  SET "a=256"
                  SET "r=4"
                  SET "s=3"
                  SET "k=480"
                  SET "j=640"
                ) ELSE (
                  IF [[ "%preset%" == "5" "]]" (
                    SET "a=192"
                    SET "r=4"
                    SET "s=3"
                    SET "k=480"
                    SET "j=640"
                  ) ELSE (
                    IF [[ "%preset%" == "6" "]]" (
                      SET "a=160"
                      SET "r=4"
                      SET "s=3"
                      SET "k=480"
                      SET "j=640"
                    ) ELSE (
                      IF [[ "%preset%" == "7" "]]" (
                        SET "a=128"
                        SET "r=4"
                        SET "s=3"
                        SET "k=480"
                        SET "j=640"
                      ) ELSE (
                        IF [[ "%preset%" == "8" "]]" (
                          SET "a=256"
                          SET "r=16"
                          SET "s=9"
                          SET "k=272"
                          SET "j=480"
                        ) ELSE (
                          IF [[ "%preset%" == "9" "]]" (
                            SET "a=192"
                            SET "r=16"
                            SET "s=9"
                            SET "k=272"
                            SET "j=480"
                          ) ELSE (
                            IF [[ "%preset%" == "A" "]]" || [[ "%preset%" == "a" "]]" (
                              SET "a=160"
                              SET "r=16"
                              SET "s=9"
                              SET "k=272"
                              SET "j=480"
                            ) ELSE (
                              IF [[ "%preset%" == "B" "]]" || [[ "%preset%" == "b" "]]" (
                                SET "a=128"
                                SET "r=16"
                                SET "s=9"
                                SET "k=272"
                                SET "j=480"
                              ) ELSE (
                                IF [[ "%preset%" == "C" "]]" || [[ "%preset%" == "c" "]]" (
                                  SET "a=256"
                                  SET "r=4"
                                  SET "s=3"
                                  SET "k=240"
                                  SET "j=320"
                                ) ELSE (
                                  IF [[ "%preset%" == "D" "]]" || [[ "%preset%" == "d" "]]" (
                                    SET "a=192"
                                    SET "r=4"
                                    SET "s=3"
                                    SET "k=240"
                                    SET "j=320"
                                  ) ELSE (
                                    IF [[ "%preset%" == "E" "]]" || [[ "%preset%" == "e" "]]" (
                                      SET "a=160"
                                      SET "r=4"
                                      SET "s=3"
                                      SET "k=240"
                                      SET "j=320"
                                    )
                                  )
                                )
                              )
                            )
                          )
                        )
                      )
                    )
                  )
                )
              )
            )
          )
        )
      )
    )
  )
  CALL :create
  echo "
      To change part of the command, type 'help' for a list of commands, and use the commands thereof.
      Thank you."
)

EXIT /B %ERRORLEVEL%

:vbitrate
SET "y=1"
read "-p" "What bitrate for video? (kbps): " "p"
EXIT /B 0

:file_in
local "success=FALSE"
REM UNKNOWN: {"type":"Until","clause":{"type":"CompoundList","commands":[{"type":"Command","name":{"text":"[[","type":"Word"},"suffix":[{"text":"\"$success\"","expansion":[{"loc":{"start":1,"end":8},"parameter":"success","type":"ParameterExpansion"}],"type":"Word"},{"text":"==","type":"Word"},{"text":"TRUE","type":"Word"},{"text":"]]","type":"Word"}]}]},"do":{"type":"CompoundList","commands":[{"type":"Command","name":{"text":"read","type":"Word"},"suffix":[{"text":"-p","type":"Word"},{"text":"Please enter location of input file: ","type":"Word"},{"text":"i","type":"Word"}]},{"type":"If","clause":{"type":"CompoundList","commands":[{"type":"Command","name":{"text":"[[","type":"Word"},"suffix":[{"text":"\"$i\"","expansion":[{"loc":{"start":1,"end":2},"parameter":"i","type":"ParameterExpansion"}],"type":"Word"},{"text":"==","type":"Word"},{"text":"~/*","type":"Word"},{"text":"]]","type":"Word"}]}]},"then":{"type":"CompoundList","commands":[{"type":"Command","prefix":[{"text":"i=\"${i:2}\"","expansion":[{"loc":{"start":3,"end":8},"parameter":"i","type":"ParameterExpansion","op":"substring","offset":2}],"type":"AssignmentWord"}]},{"type":"Command","prefix":[{"text":"i=\"/home/$(whoami)/${i}\"","expansion":[{"loc":{"start":9,"end":17},"command":"whoami","type":"CommandExpansion","commandAST":{"type":"Script","commands":[{"type":"Command","name":{"text":"whoami","type":"Word"}}]}},{"loc":{"start":19,"end":22},"parameter":"i","type":"ParameterExpansion"}],"type":"AssignmentWord"}]}]}},{"type":"If","clause":{"type":"CompoundList","commands":[{"type":"Command","name":{"text":"[[","type":"Word"},"suffix":[{"text":"!","type":"Word"},{"text":"-f","type":"Word"},{"text":"\"$i\"","expansion":[{"loc":{"start":1,"end":2},"parameter":"i","type":"ParameterExpansion"}],"type":"Word"},{"text":"]]","type":"Word"}]}]},"then":{"type":"CompoundList","commands":[{"type":"Command","name":{"text":"echo","type":"Word"},"suffix":[{"text":"\"ERROR: '$i': No such file. Please choose a video file that actually exists.\"","expansion":[{"loc":{"start":9,"end":10},"parameter":"i","type":"ParameterExpansion"}],"type":"Word"}]},{"type":"Command","name":{"text":"echo","type":"Word"},"suffix":[{"text":"","type":"Word"}]}]},"else":{"type":"If","clause":{"type":"CompoundList","commands":[{"type":"Command","name":{"text":"[[","type":"Word"},"suffix":[{"text":"\"$(file -b --mime-type \"$i\")\"","expansion":[{"loc":{"start":1,"end":27},"command":"file -b --mime-type \"$i\"","type":"CommandExpansion","commandAST":{"type":"Script","commands":[{"type":"Command","name":{"text":"file","type":"Word"},"suffix":[{"text":"-b","type":"Word"},{"text":"--mime-type","type":"Word"},{"text":"\"$i\"","expansion":[{"loc":{"start":1,"end":2},"parameter":"i","type":"ParameterExpansion"}],"type":"Word"}]}]}}],"type":"Word"},{"text":"!=","type":"Word"},{"text":"video/*","type":"Word"},{"text":"]]","type":"Word"}]}]},"then":{"type":"CompoundList","commands":[{"type":"Command","name":{"text":"echo","type":"Word"},"suffix":[{"text":"\"ERROR: '$i' does not seem to be a valid video file.\"","expansion":[{"loc":{"start":9,"end":10},"parameter":"i","type":"ParameterExpansion"}],"type":"Word"}]},{"type":"Command","name":{"text":"echo","type":"Word"},"suffix":[{"text":"","type":"Word"}]}]},"else":{"type":"CompoundList","commands":[{"type":"Command","name":{"text":"local","type":"Word"},"suffix":[{"text":"success=TRUE","type":"Word"}]}]}}}]}}
EXIT /B 0

:file_out
local "success=FALSE"
REM UNKNOWN: {"type":"Until","clause":{"type":"CompoundList","commands":[{"type":"Command","name":{"text":"[[","type":"Word"},"suffix":[{"text":"\"$success\"","expansion":[{"loc":{"start":1,"end":8},"parameter":"success","type":"ParameterExpansion"}],"type":"Word"},{"text":"==","type":"Word"},{"text":"TRUE","type":"Word"},{"text":"]]","type":"Word"}]}]},"do":{"type":"CompoundList","commands":[{"type":"Command","name":{"text":"read","type":"Word"},"suffix":[{"text":"-p","type":"Word"},{"text":"Please enter location of output file: ","type":"Word"},{"text":"o","type":"Word"}]},{"type":"If","clause":{"type":"CompoundList","commands":[{"type":"Command","name":{"text":"[[","type":"Word"},"suffix":[{"text":"\"$o\"","expansion":[{"loc":{"start":1,"end":2},"parameter":"o","type":"ParameterExpansion"}],"type":"Word"},{"text":"==","type":"Word"},{"text":"~/*","type":"Word"},{"text":"]]","type":"Word"}]}]},"then":{"type":"CompoundList","commands":[{"type":"Command","prefix":[{"text":"o=\"${o:2}\"","expansion":[{"loc":{"start":3,"end":8},"parameter":"o","type":"ParameterExpansion","op":"substring","offset":2}],"type":"AssignmentWord"}]},{"type":"Command","prefix":[{"text":"o=\"/home/$(whoami)/${o}\"","expansion":[{"loc":{"start":9,"end":17},"command":"whoami","type":"CommandExpansion","commandAST":{"type":"Script","commands":[{"type":"Command","name":{"text":"whoami","type":"Word"}}]}},{"loc":{"start":19,"end":22},"parameter":"o","type":"ParameterExpansion"}],"type":"AssignmentWord"}]}]}},{"type":"If","clause":{"type":"CompoundList","commands":[{"type":"Command","name":{"text":"[[","type":"Word"},"suffix":[{"text":"!","type":"Word"},{"text":"-d","type":"Word"},{"text":"\"$(dirname \"$o\")\"","expansion":[{"loc":{"start":1,"end":15},"command":"dirname \"$o\"","type":"CommandExpansion","commandAST":{"type":"Script","commands":[{"type":"Command","name":{"text":"dirname","type":"Word"},"suffix":[{"text":"\"$o\"","expansion":[{"loc":{"start":1,"end":2},"parameter":"o","type":"ParameterExpansion"}],"type":"Word"}]}]}}],"type":"Word"},{"text":"]]","type":"Word"}]}]},"then":{"type":"CompoundList","commands":[{"type":"Command","name":{"text":"echo","type":"Word"},"suffix":[{"text":"\"ERROR: '$(dirname \"$o\")': No such directory exists. Please choose a directory that exists.\"","expansion":[{"loc":{"start":9,"end":23},"command":"dirname \"$o\"","type":"CommandExpansion","commandAST":{"type":"Script","commands":[{"type":"Command","name":{"text":"dirname","type":"Word"},"suffix":[{"text":"\"$o\"","expansion":[{"loc":{"start":1,"end":2},"parameter":"o","type":"ParameterExpansion"}],"type":"Word"}]}]}}],"type":"Word"}]},{"type":"Command","name":{"text":"echo","type":"Word"},"suffix":[{"text":"","type":"Word"}]}]},"else":{"type":"If","clause":{"type":"CompoundList","commands":[{"type":"Command","name":{"text":"[[","type":"Word"},"suffix":[{"text":"-f","type":"Word"},{"text":"\"$o\"","expansion":[{"loc":{"start":1,"end":2},"parameter":"o","type":"ParameterExpansion"}],"type":"Word"},{"text":"]]","type":"Word"}]}]},"then":{"type":"CompoundList","commands":[{"type":"Command","name":{"text":"echo","type":"Word"},"suffix":[{"text":"\"ERROR: '$o': File already exists. Please choose a different filename.\"","expansion":[{"loc":{"start":9,"end":10},"parameter":"o","type":"ParameterExpansion"}],"type":"Word"}]},{"type":"Command","name":{"text":"echo","type":"Word"},"suffix":[{"text":"","type":"Word"}]}]},"else":{"type":"CompoundList","commands":[{"type":"Command","name":{"text":"local","type":"Word"},"suffix":[{"text":"success=TRUE","type":"Word"}]}]}}}]}}
EXIT /B 0

:bitrate
read "-p" "What bitrate for audio? (kbps): " "a"
IF [[ "-z" "%a%" "]]" (
  SET "a=160"
)
EXIT /B 0

:aspect
read "-p" "Height of Aspect ratio?: " "r"
IF [[ "-z" "%r%" "]]" (
  SET "r=16"
)
read "-p" "Lenght of Aspect ratio?: " "s"
IF [[ "-z" "%s%" "]]" (
  SET "s=9"
)
EXIT /B 0

:viddim
read "-p" "What length?: " "j"
IF [[ "-z" "%j%" "]]" (
  SET "j=720"
)
read "-p" "What height?: " "k"
IF [[ "-z" "%k%" "]]" (
  SET "k=480"
)
EXIT /B 0

:show_help
echo "file_in: changes file input
file_out: changes file output
bitrate: changes audio bitrate
aspect: changes aspect ratio
viddim: changes video dimensions
vbitrate: changes video bitrate
create: outputs the command"
EXIT /B 0

:create
echo ""
echo "Here is your command!"
echo ""
IF [[ "%y%" == "1" "]]" (
  SET "cmd="ffmpeg -i %i% -vcodec libx264 -b:v %p%k -s %j%x%k% -aspect 16:9 -profile:v main -level:v 2.1 -x264-params ref"
) ELSE (
  SET "cmd="ffmpeg -i %i% -vcodec libx264 -s %j%x%k% -aspect 16:9 -profile:v main -level:v 2.1 -x264-params ref"
)
echo "%cmd%"
echo ""
read "-p" "Would you like to run this command now? [y/N]: " "run_cmd_now"
IF [[ "%run_cmd_now%" == "Y" "]]" || [[ "%run_cmd_now%" == "y" "]]" (
  echo "RUNNING COMMAND..."
  eval "%cmd%"
)
EXIT /B 0
