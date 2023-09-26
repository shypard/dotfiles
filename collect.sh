#/bin/bash

set -e

# copy all configured dotfiles to this repository
for f in $(ls .config); do
    cp --recursive --update $f .config
done
