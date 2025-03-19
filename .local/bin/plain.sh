#! /bin/sh

# Uncomment the next line for debugging
#set -x

if [ $# -ne 4 ]; then
    echo "Usage: $0 <font> <size> <text> <output>"
    echo "Environment variables:"
    echo "  FORE    (default: White)"
    echo "  BACK    (default: Black)"
    echo "  WIDTH   (default: 2)"
    echo "  GRAVITY (default: Center)"
    exit
fi

if [ -z $FORE ]; then
    FORE=White
fi
if [ -z $BACK ]; then
    BACK=Black
fi
if [ -z $WIDTH ]; then
    WIDTH=2
fi
if [ -z $GRAVITY ]; then
    GRAVITY=Center
fi

if [ $WIDTH -eq 0 ]; then
    magick -size 1024x1024 canvas:none -font $1 -pointsize $2 -gravity $GRAVITY \
        -fill $FORE -annotate 0 "$3" \
        $4
else
    magick -size 1024x1024 canvas:none -font $1 -pointsize $2 -gravity $GRAVITY \
        -fill $FORE -stroke $BACK -strokewidth $WIDTH -annotate 0 "$3" \
        $4
fi
mogrify -trim +repage $4
