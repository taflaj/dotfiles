#! /usr/bin/env sh

# Uncomment the next line for debugging
#set -x

if [ $# -ne 4 ]
then
    echo "Usage: $0 <font> <size> <text> <output>"
    echo "Environment variables:"
    echo "  FORE    (default: White)"
    echo "  BACK    (default: Black)"
    echo "  GRAVITY (default: Center)"
    echo "  OFFSET  (default: +2+2)"
    exit
fi

if [ -z $FORE ]
then
    FORE=White
fi
if [ -z $BACK ]
then
    BACK=Black
fi
if [ -z $GRAVITY ]
then
    GRAVITY=Center
fi
if [ -z $OFFSET ]
then
    OFFSET=+2+2
fi

convert -size 800x800 canvas:none -font $1 -pointsize $2 -gravity $GRAVITY \
    -stroke $BACK -strokewidth 4 \
    -annotate $OFFSET "$3" \
    -channel RGBA -blur 4x4 \
    -fill $FORE -stroke none \
    -annotate 0 "$3" \
    $4
mogrify -trim +repage $4
