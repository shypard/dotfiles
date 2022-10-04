# Custom Fedora Wayland Setup

This repository serves as an example how to setup Fedora Linux and install basic wayland applications.

## Fedora Installation

1. Download the "Everything" Image from the (https://alt.fedoraproject.org/)[Fedora Website]
2. During the Fedora installation process, make sure to select only the Fedora Basic Software Selection.
3. Let the automatic installer rrun

## Sway and Friends

Switch to root and run following instructions.

```bash
# enable 3rd party repos
dnf copr enable eddsalkield/swaylock-effects -y
dnf copr enable alebastr/sway-extras -y

# sway basics
dnf install sway waybar swayidle swaybg bemenu wob -y

# clipboard
dnf install clipman wl-clipboard -y

# display settings
dnf install wdisplays wlsunset light -y

# screenshotting
dnf install grim slurp swappy -y

# screen sharing
dnf install xdg-desktop-portal-wlr xdg-desktop-portal -y

# shell and terminal
dnf install zsh alacritty -y

# launcher and menu
dnf install wofi nwg-launchers -y

# lockscreen
dnf install swaylock-effects -y

# install greetd + tuigreet as display manager
dnf install greetd-tuigreet -y

# make sure we don't boot into "text mode"
systemctl set-default graphical.target

# enable systemd daemon
systemctl enable --now greetd.service

# Setup greetd daemon to use tuigreet
cat > /etc/greetd/config.toml << EOF
[terminal]
vt = "current"

[default_session]
command = "tuigreet --cmd sway -w 40 -g 'Log in' -r -t --asterisks --power-shutdown 'sudo systemctl poweroff'"
user = "greeter"
EOF

# reboot into graphical target
reboot
```

## User Apps

```bash
# Prepare
sudo dnf install dnf-plugins-core -y
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

# Update package cache
dnf check-update

# Install System Applications
sudo dnf group install "Hardware Support"
sudo dnf install -y \
    polkit \
    NetworkManager-tui \
    blueman

# Install Desktop Applications
sudo dnf install -y \
    neovim \
    brave-browser \
    imv \
    ranger \
    vlc \
    xournalpp \
    zsh

# Install Dev Tools
sudo dnf install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-compose-plugin \
    git \
    python3 \
    python3-pip \
    code

# Post Install
sudo systemctl enable docker

# Change default shell to zsh
sudo usermod -s /usr/bin/zsh $USERNAME

# Install Oh my Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Remove unused Term Emulators
sudo dnf remove foot
```

## Install Dotfiles

Make sure your git configuration is correctly setup.

```bash
git clone git@github.com:shypard/dotfiles.git
cp -rf dotfiles/.config $HOME/
```

## Troubleshooting

* Reload Sway: `Mod+Shift+c`
* Check if Sway detects all monitors: ``swaymsg -t get_ouputs``
* Enable a display: ``swaymsg output DP-4 enabl``
*