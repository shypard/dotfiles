#!/bin/sh

# Locks the screen immediately
swaylock -f -C $HOME/.config/swaylock/config

# Kills last background task so idle timer doesn't keep running
kill %
