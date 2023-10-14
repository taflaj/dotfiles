#! /usr/bin/env sh

grim /tmp/screen.png
convert /tmp/screen.png -blur 5x4 /tmp/screen.jpeg
swaylock -f -i /tmp/screen.jpeg
