#! /usr/bin/env sh
# wayidle.sh

# Uncomment the next line for debugging
# set -x

swayidle -w \
    timeout 540 '~/.local/bin/swaylock.sh' \
    timeout 720 'hyprctl dispatch dpms off' \
        resume 'hyprctl dispatch dpms on' \
    timeout 1800 'systemctl suspend' \
    before-sleep 'swaylock --daemonize --color 282a36'
