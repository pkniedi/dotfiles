#!/usr/bin/env bash


packages=(
        "python-wal"
)



for package in "${packages[@]}"
do
    echo "Installing $package"
    pacman -S --needed --noconfirm $package
done
