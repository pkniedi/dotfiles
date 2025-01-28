#!/usr/bin/env bash

# sudo pacman -S --needed git base-devel

which yay &>/dev/null
if [[ ! $? ]]; then
        echo ":: Installing yay"
        git clone https://aur.archlinux.org/yay-bin.git
        cd yay-bin
        makepkg -si
else
        echo ":: yay already installed. Skipping"
fi

yay -S --needed ansible-core
make --file=../Makefile install
