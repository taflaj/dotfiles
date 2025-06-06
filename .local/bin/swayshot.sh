#! /usr/bin/env sh

FOLDER=~/Pictures/Screenshots
if [ ! -d $FOLDER ]; then
    mkdir -p $FOLDER
fi
FILE=$FOLDER/screenshot\ $(date +"%Y%m%d %H%M%S").png
grim "$FILE"
notify-send --expire-time=3000 "Screenshot saved" "$FILE"
