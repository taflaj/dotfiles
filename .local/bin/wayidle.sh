#! /usr/bin/env sh
# wayidle.sh

# Uncomment the next line for debugging
# set -x

swayidle -w \
    timeout 540 'hyprlock' \
    timeout 720 'hyprctl dispatch dpms off' \
        resume 'hyprctl dispatch dpms on' \
    before-sleep 'swaylock --daemonize --color 282a36'

# Line removed: timeout 1800 'systemctl suspend'
