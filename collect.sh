#/bin/bash
# Collects all desired dotfiles and copies them to this git repository

dotfiles=(
    "$HOME/.config/zathura"
    "$HOME/.config/alacritty"
    "$HOME/.config/nvim"
    "$HOME/.config/sway"
    "$HOME/.config/waybar"
    "$HOME/.config/ranger"
    "$HOME/.config/swaylock"
    "$HOME/.config/wofi"
    "$HOME/.config/mako"
    "$HOME/.config/aerc"
)

# copy all files to this directory
for f in "${dotfiles[@]}"; do
    ls $f
    cp --recursive --update $f .config
done

