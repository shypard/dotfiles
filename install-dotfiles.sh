#!/bin/bash
set -e

# Create a temporary directory and cd into it
tmp_dir=$(mktemp -d)
cd "$tmp_dir"

# Clone the dotfiles repo
git clone -q https://github.com/shypard/dotfiles.git dotfiles
cd dotfiles

# Define the backup directory
backup_dir="$tmp_dir/backup"
mkdir -p "$backup_dir"

# Copy original files to the backup directory
for p in $(grep -v ^# packages.txt | grep -v ^$); do
    echo -n "Backing up $p..."
    [ $(cp -r $HOME/.config/$p $backup_dir/$p) ] && echo "OK" || echo "File does not exist"
done

# Create a tarball of the backup directory
tarball="dotfiles-backup-$(date +%Y-%m-%d_%H%M%S).tar.gz"
tar -czvf $tarball $backup_dir 2>/dev/null

echo "Backup created at $tmp_dir/$tarball. Installing new dotfiles..."

# Copy all files to ~/.config
mkdir -p $HOME/.config 
cp -r .config/* $HOME/.config/

echo "Installation complete! Cleaning up..."

# Clean up temporary files
rm -rf "$tmp_dir"
