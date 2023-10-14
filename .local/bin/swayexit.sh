#! /usr/bin/env bash
# i3exit.sh

[[ $(cat /proc/1/comm) == "systemd" ]] && logind=systemctl || logind=loginctl
swaylock=/home/zezo/.local/bin/swaylock.sh

case "$1" in
    lock)
        $swaylock
        ;;
    logout)
        swaymsg exit
        ;;
    switch_user)
        #dm-tool switch-to-greeter
        ;;
    suspend)
        $swaylock && $logind suspend
        ;;
    hibernate)
        $swaylock && $logind hibernate
        ;;
    reboot)
        $logind reboot
        ;;
    shutdown)
        $logind poweroff
        ;;
    *)
        echo "== ! swayexit.sh: missing or invalid argument ! =="
        echo "Try again with: lock | logout | switch_user | suspend | hibernate | reboot | shutdown"
        exit 2
esac

exit 0
