#!/bin/sh

# Times the screen off and puts it to background
swayidle \
    timeout 5 'swaymsg "output * dpms off"' \
    resume 'swaymsg "output * dpms on"' &

# Locks the screen immediately
swaylock \
    --screenshots \
    --clock \
    --effect-blur 7x5
    --effect-vignette 0.5:0.5 \
    --grace 2 \
	--fade-in 1

# Kills last background task so idle timer doesn't keep running
kill %%
