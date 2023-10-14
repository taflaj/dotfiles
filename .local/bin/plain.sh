#! /usr/bin/env sh

# Uncomment the next line for debugging
#set -x

if [ $# -ne 4 ]
then
    echo "Usage: $0 <font> <size> <text> <output>"
    echo "Environment variables:"
    echo "  FORE    (default: White)"
    echo "  BACK    (default: Black)"
    echo "  WIDTH   (default: 2)"
    echo "  GRAVITY (default: Center)"
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
if [ -z $WIDTH ]
then
    WIDTH=2
fi
if [ -z $GRAVITY ]
then
    GRAVITY=Center
fi

if [ $WIDTH -eq 0 ]
then
    convert -size 800x800 canvas:none -font $1 -pointsize $2 -gravity $GRAVITY \
        -fill $FORE -annotate 0 "$3" \
        $4
else
    convert -size 800x800 canvas:none -font $1 -pointsize $2 -gravity $GRAVITY \
        -fill $FORE -stroke $BACK -strokewidth $WIDTH -annotate 0 "$3" \
        $4
fi
mogrify -trim +repage $4
