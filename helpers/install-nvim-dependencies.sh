#!/usr/env/bin bash

# Install neovim dependencies
# Add language servers to the packages array

packages=(
        "neovim"
)

for package in "${packages[@]}"; do
    pacman -S --noconfirm --needed "$package"
done
