#!/bin/bash
set -e

# enable 3rd party repos
sudo dnf enable -y           \
    trs-sod/swaylock-effects \

# installing login-, session and window manager
sudo dnf install -y \
    greetd-tuigreet \
    seatd

# installing user applications
sudo dnf install -y     \
    alacritty           \
    clang               \
    dnf-plugins-core    \
    git                 \
    grim                \
    mako                \
    neovim              \
    udiskie             \
    slurp               \
    swappy              \
    swaylock-effects    \
    pandoc              \
    wofi                \
    zathura             \
    zathura-plugins-all \
    zsh

# install misc
pip3 install --user jedi --upgrade # neovim python support

# configure tui-greet
sudo cat << EOF | sudo tee /etc/greetd/config.toml
[terminal]
vt = "current"

[default_session]
user = "greetd"
command = "tuigreet --cmd sway -w 40 -g 'Log in' -r -t --asterisks --power-shutdown 'sudo systemctl poweroff'"
EOF

# enable greetd, seatd and ssh server
sudo systemctl set-default graphical.target
sudo systemctl enable --now greetd.service
sudo systemctl enable --now seatd.service
sudo systemctl enable --now sshd.service

# add user to seat group
sudo usermod -a -G seat $(whoami)

# remove unused services and tools
sudo dnf remove -y \
    sddm           \
    foot           \
    rofi           \
    swaylock       \

echo "Done"
