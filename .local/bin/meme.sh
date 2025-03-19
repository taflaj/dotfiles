#! /bin/sh

# Uncomment the next line for debugging
#set -x

if [ $# -ne 4 ]; then
    echo "Usage: $0 <font> <size> <text> <output>"
    exit
fi
magick -size 1024x1024 canvas:none \
    -font $1 -pointsize $2 -gravity Center -fill White -stroke Black -strokewidth 2 -annotate 0 "$3" \
    $4
mogrify -trim +repage $4
