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
sudo cat > /etc/greetd/config.toml << EOF
[terminal]
vt = "current"

[default_session]
user = "greetd"
command = "tuigreet \
    --cmd sway \
    -w 40 \
    -g 'Log in' \
    -r \
    -t \
    --asterisks \
    --power-shutdown 'sudo systemctl poweroff'"
EOF

# enable greetd and seatd services
sudo systemctl set-default graphical.target
sudo systemctl enable --now greetd.service
sudo systemctl enable --now seatd.service

# add user to seat group
sudo usermod -a -G seat $(whoami)

echo "Done"
