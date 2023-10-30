#!/bin/bash
set -e

# installing login- and window manager
sudo dnf install -y \
    greetd-tuigreet \
    seatd

# installing user applications
sudo dnf install -y \
    dnf-plugins-core \
    alacritty \
    zsh \
    neovim \
    zathura \
    git

# configure tui-greet
sudo cat << EOF | sudo tee /etc/greetd/config.toml
[terminal]
vt = "current"

[default_session]
user = "greetd"
command = "tuigreet --cmd sway -w 40 -g 'Log in' -r -t --asterisks --power-shutdown 'sudo systemctl poweroff'"
EOF

# remove unused services and tools
sudo dnf remove -y \
    sddm \
    foot

# enable greetd, seatd and ssh server
sudo systemctl set-default graphical.target
sudo systemctl enable --now greetd.service
sudo systemctl enable --now seatd.service
sudo systemctl enable --now sshd.service

# add user to seat group
sudo usermod -a -G seat $(whoami)

echo "Done"
