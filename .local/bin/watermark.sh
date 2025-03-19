#! /bin/sh

# Uncomment the next line for debugging
#set -x

if [ $# -ne 4 ]; then
    echo "Usage: $0 <font> <size> <text> <output>"
    exit
fi

FORE=/tmp/fore.png
MASK=/tmp/mask.png

magick -size 800x800 canvas:Grey30 \
    -font $1 -pointsize $2 -gravity Center \
    -fill Grey70 -annotate 0 "$3" \
    $FORE
magick -size 800x800 canvas:Black \
    -font $1 -pointsize $2 -gravity Center \
    -fill White -annotate +1+1 "$3" \
        -annotate 0    "$3" \
    -fill Black -annotate -1-1 "$3" \
    -alpha Off \
    $MASK
composite -compose CopyOpacity $MASK $FORE $4
mogrify -trim +repage $4
