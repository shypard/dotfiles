# Custom Fedora Wayland Setup

This repository serves as an example how to setup Fedora Linux and install basic wayland applications.

## Fedora Installation

1. Download the "Everything" Image from the (https://alt.fedoraproject.org/)[Fedora Website]
2. During the Fedora installation process, make sure to select the "i3" Software Selection
3. Let the automatic installer rrun

## Sway and Friends

Switch to root and run following instructions.

```bash
sudo -i

# enable 3rd party repos
dnf copr enable eddsalkield/swaylock-effects -y
dnf copr enable alebastr/sway-extras -y

# install sway applications
dnf install sway waybar swayidle swaybg bemenu wob -y       # sway basics
dnf install clipman wl-clipboard -y                         # clipboard
dnf install wdisplays wlsunset light -y                     # display settings
dnf install grim slurp swappy -y                            # screenshotting
dnf install xdg-desktop-portal-wlr xdg-desktop-portal -y    # screen sharing
dnf install zsh alacritty -y                                # shell and terminal
dnf install wofi nwg-launchers -y                           # launcher and menu
dnf install swaylock-effects -y                             # lockscreen
dnf install greetd-tuigreet -y                              # install greetd + tuigreet as display manager

# prepare systemd service
systemctl set-default graphical.target                      # make sure we don't boot into "text mode"
systemctl enable --now greetd.service                       # enable systemd daemon
cat > /etc/greetd/config.toml << EOF
[terminal]
vt = "current"

[default_session]
command = "tuigreet --cmd sway -w 40 -g 'Log in' -r -t --asterisks"
user = "greeter"
EOF                                                         # configure greetd

reboot
```

## User Apps

```bash
# Prepare
sudo dnf install dnf-plugins-core -y
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

# Install System Applications
sudo dnf install -y \
    polkit

# Install Desktop Applications
sudo dnf install -y \
    neovim \
    brave-browser \
    imv \
    ranger

# Install Dev Tools
sudo dnf install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-compose-plugin \
    git \
    python3 \
    python3-pip

# Post Install
sudo systemctl enable docker
```

## Install Dotfiles
```bash
git clone git@github.com:shypard/dotfiles.git $HOME/.config
git config --local status.showUntrackedFiles no
git checkout && git reset --hard
```