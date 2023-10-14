#! /usr/bin/env sh

# Uncomment the next line for debugging
#set -x

if [ $# -ne 4 ]
then
    echo "Usage: $0 <font> <size> <text> <output>"
    exit
fi
convert -size 800x800 canvas:none \
    -font $1 -pointsize $2 -gravity Center -fill White -stroke Black -strokewidth 2 -annotate 0 "$3" \
    $4
mogrify -trim +repage $4
