#!/bin/sh

swaylock_options='--screenshots \
    --clock \
    --effect-blur 7x5 \
    --effect-vignette 0.5:0.5 \
    --grace 2 \
    --fade-in 1'

# Lock screen automatically after 5 minutes, then turn off after another 5mins.
swayidle -w \
    timeout 300 "swaylock -f $swaylock_options" \
    timeout 600 'swaymsg "output * dpms off"' \\
            resume 'swaymsg "output * dpms on"' \\
            before-sleep "swaylock -f $swaylock_options"


# Locks the screen immediately
swaylock $swaylock_options

# Kills last background task so idle timer doesn't keep running
kill %%
