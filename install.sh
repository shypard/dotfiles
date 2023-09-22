#!/bin/bash
set -e

# Create a temporary directory and cd into it
tmp_dir=$(mktemp -d)
cd "$tmp_dir"

# Clone the dotfiles repo
git clone -q git@github.com:shypard/dotfiles.git dotfiles 

# Define the backup directory
backup_dir="$tmp_dir/backup"
mkdir -p "$backup_dir"

# Copy original files to the backup directory
for f in $(ls dotfiles/.config); do
    echo "Backing up $f..."
    cp -r ~/.config/$f $backup_dir/$f 2>/dev/null || true
done

# Create a tarball of the backup directory
tarball="dotfiles-backup-$(date +%Y-%m-%d_%H%M%S).tar.gz"
tar -czvf $tarball $backup_dir

echo "Backup created at $tarball. Installing new dotfiles..."

# Copy all files to ~/.config
cp -r dotfiles/.config/* ~/.config/

echo "Installation complete! Cleaning up..."

# Clean up temporary files
rm -rf "$tmp_dir"
