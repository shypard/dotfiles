#!/bin/bash
set -e

# enable 3rd party repos
sudo dnf enable -y \
    eddsalkield/swaylock-effects \

# installing login-, session and window manager
sudo dnf install -y \
    greetd-tuigreet \
    seatd

# Install applications from packages.txt
for p in $(grep -v ^# packages.txt | grep -v ^$); do
    echo -n "Installing $p... "
    sudo dnf install -assumeyes --quiet $p
done

# installing user applications
sudo dnf install -y     \
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
    zathura             \
    zathura-plugins-all \

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

echo "Done"
