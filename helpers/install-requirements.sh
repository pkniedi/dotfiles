#!/usr/bin/env bash

source library.sh

packages=(
"coreutils"
"base-devel"
"wget"
"unzip"
"gum"
"rsync"
"figlet"
"which"
"curl"
)


# Install required packages
echo ":: Checking that required packages are installed..."
_installPackages "${packages[@]}";

# Double check rsync
if ! command -v rsync &> /dev/null; then
    echo ":: Force rsync installation"
    sudo pacman -S rsync --noconfirm
else
    echo ":: rsync double checked"
fi
echo
