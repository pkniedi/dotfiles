#!/usr/bin/env zsh

# The script uses  slurp  to select the area to capture, then  grim  to capture the screen and  swappy  to save the file.

TFILE=screencapture-$(date +'%Y-%m-%d_%H-%M-%S').png
grim -g "$(slurp)" - | swappy -f - -o ~/screenshots/$TFILE

notify-send  -u=normal "INFO" "File saved to" "$TFILE"

