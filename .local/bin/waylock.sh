#! /usr/bin/env sh

grim /tmp/screen.jpeg
magick /tmp/screen.jpeg -blur 5x4 /tmp/screenblur.jpeg
swaylock -f -i /tmp/screenblur.jpeg
