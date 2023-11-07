#!/bin/sh

# Lock screen automatically after 5 minutes, then turn off after another 5mins.
swayidle -w \
    timeout 300 "swaylock -f -c 000000" \
    timeout 1200 'swaymsg "output * dpms off"' \\
            resume 'swaymsg "output * dpms on"' \\
            before-sleep "swaylock -f -c 000000"


# Locks the screen immediately
swaylock -c 000000

# Kills last background task so idle timer doesn't keep running
kill %
