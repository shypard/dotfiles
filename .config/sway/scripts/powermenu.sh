#!/usr/bin/env bash

entries="⇠ Logout\n Lock\n⏾ Suspend\n⭮ Reboot\n⏻ Shutdown"
selected=$(echo -e $entries|wofi --width 250 --height 260 --dmenu --cache-file /dev/null | awk '{print tolower($2)}')

case $selected in
    lock)
        exec swaylock -f -c 000000;;
    logout)
        swaymsg exit;;
    suspend)
        exec systemctl suspend;;
    reboot)
        exec systemctl reboot;;
    shutdown)
    exec systemctl poweroff -i;;
esac
