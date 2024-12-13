#!/usr/bin/env zsh

# Backup official packages
echo "Backing up official pacman packages..."
pacman -Qe > /tmp/pacman_installed_packages.txt
echo "Official packages saved to pacman_installed_packages.txt."

# Backup AUR packages
echo "Backing up AUR packages..."
yay -Qe | grep -v "pacman" > /tmp/yay_installed_packages.txt
echo "AUR packages saved to yay_installed_packages.txt."

echo "Backup completed!"

