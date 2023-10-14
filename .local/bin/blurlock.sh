#! /usr/bin/env bash
# blurlock.sh

# take screenshot
import -window root /tmp/screenshot.png

# blur it
convert /tmp/screenshot.png -blur 5x4 /tmp/screenshotblur.png

# lock the screen
i3lock -i /tmp/screenshotblur.png

# add a small delay to prevent possible race conditions with suspend
sleep 1

exit 0
