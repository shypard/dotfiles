#!/bin/sh

image=$(mktemp --suffix=.jpg)
echo "Taking screenshot..."

echo "Blurring..."
convert -filter Gaussian -resize 20% -blur 0x5 -resize 500% $HOME/.config/sway/assets/bg/forest.jpg $image

echo "Locking..."
swaylock -i $image

