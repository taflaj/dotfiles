#! /usr/bin/env sh

# set -x

DEST=~/.local/share/backgrounds
mkdir -p $DEST
cd $DEST
for F in `find ~ /etc/ /opt/ /usr/ -name *.jxl 2> /dev/null`; do
    S=`sha256sum <<< $F | cut -d\  -f1`.jpeg
    if ! [ -e $S ]; then
        echo $S '<=' $F
        magick $F $S
    fi
done
~/.local/bin/changer.py reload
grep repo /tmp/changer.log