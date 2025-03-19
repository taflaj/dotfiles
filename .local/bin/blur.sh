#! /usr/bin/env sh

magick $1 -auto-orient /tmp/oriented.png
magick /tmp/oriented.png -resize 1920x1080 /tmp/scaled.png
magick -size 1920x1080 canvas:none -gravity Center /tmp/oriented.png -resize 1920 -composite /tmp/zoomed.jpeg
magick /tmp/zoomed.jpeg -channel RGBA -blur 20x20 -gravity Center /tmp/scaled.png -composite /tmp/final.jpeg
xdg-open /tmp/final.jpeg
