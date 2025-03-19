#! /usr/bin/env sh

grim /tmp/screen.jpeg
magick /tmp/screen.jpeg -blur 5x4 /tmp/screenblur.jpeg
swaylock --daemonize --image /tmp/screenblur.jpeg
