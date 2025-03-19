#! /usr/bin/env sh
# lockexit.sh

# Uncomment the next line for debugging
# set -x

[[ $(cat /proc/1/comm) == "systemd" ]] && logind=systemctl || logind=loginctl
# waylock=~/.local/bin/waylock.sh
opt_hibernate="💤 Hibernate"
opt_lock="🔒 Lock"
opt_logout="👥 Logout"
opt_reboot="🔃 Reboot"
opt_shutdown="🚪 Shut Down"
opt_sleep="🌙 Sleep"

selected=$(
    printf "%s\n%s\n%s\n%s\n%s\n%s" "$opt_lock" "$opt_sleep" "$opt_hibernate" "$opt_logout" "$opt_reboot" "$opt_shutdown" |
    wofi --dmenu --prompt 'Lock/Exit' --insensitive --lines 8 --columns 1 --width 25%
)

case $selected in
    "$opt_hibernate")
        # $waylock && $logind hibernate
        hyprlock &
        sleep 1
        $logind hibernate
        ;;
    "$opt_lock")
        hyprlock
        ;;
    "$opt_logout")
        hyprctl dispatch exit
        ;;
    "$opt_reboot")
        $logind reboot
        ;;
    "$opt_shutdown")
        # $logind shutdown
        $logind poweroff
        ;;
    "$opt_sleep")
        # $waylock && $logind suspend
        hyprlock &
        sleep 1
        $logind suspend
        ;;
esac
