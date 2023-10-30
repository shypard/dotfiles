# Custom Fedora Wayland Setup

This repository serves as an example how to setup Fedora Linux and install
basic wayland applications.

## Installation

I use the Fedora Sway Spin image, you can download it 
[here](https://fedoraproject.org/spins/sway/download/). Mount the image and let
the liveinstaller run. Once the image is installed, remove the .iso and repower
the device.

Log in again and install the packages.

```bash
curl -sSL https://raw.githubusercontent.com/shypard/dotfiles/main/install-packages.sh | bash
```

Secondly, install the dotfiles.

```bash
curl -sSL https://raw.githubusercontent.com/shypard/dotfiles/main/install-dotfiles.sh | bash
```

## Colorize with Gruvbox

This is already done within the configuration files. The following table lists
the sources for the colors.

| App       | Source                                                           |
| --------- | ---------------------------------------------------------------- |
| Aerc      | https://github.com/shypard/aerc-gruvbox-material                 |
| Alacritty | https://gist.github.com/sainnhe/ad5cbc4f05c4ced83f80e54d9a75d22f |
| NVim      | https://github.com/sainnhe/gruvbox-material                      |
| Zathura   | https://github.com/eastack/zathura-gruvbox                       |

## Try it out

There is a Vagrantfile in the root directory, which starts a Fedora-38 VM,
installs the requirements and pulls the dotfiles. This way you can inspect the
configuration without install it to your live system.

```bash
# Install vagrant
$ sudo dnf install vagrant
$ vagrant plugin install vagrant-libvirt
$ vagrant up --provider=libvirt
```

You can login using the username `vagrant` and password `vagrant`.

## Troubleshooting

* Reload Sway: `Mod+Shift+c`
* Check if Sway detects all monitors: ``swaymsg -t get_ouputs``
* Enable a display: ``swaymsg output DP-4 enabl``
