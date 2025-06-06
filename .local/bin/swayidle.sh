#! /usr/bin/env sh
# wayidle.sh

# Uncomment the next line for debugging
# set -x

killall -q swayidle
while pgrep -x swayidle > /dev/null; do
    sleep 1
done
swayidle -w \
    timeout 300 '~/.local/bin/swaylock.sh' \
    timeout 600 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' \
    timeout 1800 'systemctl suspend' \
    before-sleep 'swaylock --daemonize --color 282a36'
