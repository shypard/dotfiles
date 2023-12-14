#!/bin/sh

# Locks the screen immediately
swaylock --daemonize --config $HOME/.config/swaylock/config

# Kills last background task so idle timer doesn't keep running
kill %
