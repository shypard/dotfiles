#!/bin/bash
set -e

# enable 3rd party repositories
sudo dnf copr enable -y \
    swayfx/swayfx

# installing login- and window manager
sudo dnf install -y \
    greetd-tuigreet \
    swayfx

# installing user applications
sudo dnf install -y \
    alacritty \
    zsh \
    neovim \
    zathura

# configure tui-greet
sudo systemctl set-default graphical.target
sudo systemctl enable --now greetd.service
cat > /etc/greetd/config.toml << EOF
[terminal]
vt = "current"

[default_session]
command = "tuigreet --cmd sway -w 40 -g 'Log in' -r -t --asterisks --power-shutdown 'sudo systemctl poweroff'"
user = "greeter"
EOF


