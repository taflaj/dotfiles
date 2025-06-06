#! /bin/bash
# i3exit.sh

[[ $(cat /proc/1/comm) == "systemd" ]] && logind=systemctl || logind=loginctl
swaylock=/home/zezo/.local/bin/swaylock.sh
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

case "$selected" in
    "$opt_lock")
        $swaylock
        ;;
    "$opt_logout")
        swaymsg exit
        ;;
    "$opt_switch_user")
        #dm-tool switch-to-greeter
        ;;
    "$opt_suspend")
        $swaylock && $logind suspend
        ;;
    "$opt_hibernate")
        $swaylock && $logind hibernate
        ;;
    "$opt_reboot")
        $logind reboot
        ;;
    "$opt_shutdown")
        $logind poweroff
        ;;
    # *)
        # echo "== ! swayexit.sh: missing or invalid argument ! =="
        # echo "Try again with: lock | logout | switch_user | suspend | hibernate | reboot | shutdown"
        # exit 2
esac

exit 0
