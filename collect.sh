#/bin/bash

set -e

packages=$(grep -v ^# packages.txt | grep -v ^$)

# copy all configured dotfiles to this repository
for p in $packages; do
    cp --recursive --update ~/.config/$p .config
done
