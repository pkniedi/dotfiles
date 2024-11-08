#!/usr/bin/env bash

# https://github.com/Jguer/yay
# Installs requirements used by later scripts and in the makefile
# Assumes that the script is run as root
# Add any additional packages to the packages array


packages=(
    "which"
    "rsync"
    "figlet"
    "fastfetch"
    "curl"
    "unzip"
)

echo "Updating system..."
pacman -Syu --noconfirm
pacman -S --noconfirm base-devel

if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi

if ! command -v yay > /dev/null; then
    echo "Installing yay..."
    # git clone https://aur.archlinux.org/yay.git
    # cd yay
    # makepkg -si
    # cd ..
    # rm -rf yay
else
    echo "yay is already installed. Skipping..."
    exit 0
fi

echo "Installing packages..."
for package in "${packages[@]}"; do
    pacman -S --noconfirm --needed "$package"
done
