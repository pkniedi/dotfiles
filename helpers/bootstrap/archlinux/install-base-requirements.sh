#!/usr/bin/env bash


PWD=$(dirname $(realpath $0))
source $PWD/library.sh

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

echo ":: Installing requirements..."

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
