#!/usr/bin/env bash

# Install oh-my-zsh
# Install zsh-autosuggestions
# Install zsh-syntax-highlighting
# Add packages to the packages array if needed

packages=(
        "zsh-syntax-highlighting"
        "fzf"
)

for package in "${packages[@]}"; do
    pacman -S --noconfirm --needed "$package"
done

if ! [ -d $HOME/.oh-my-zsh ]; then
        echo "Installing oh-my-zsh"
        git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
else
    echo "oh-my-zsh already installed"
fi

if ! [ -d $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
        git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
else
        echo "zsh-autosuggestions already installed"
fi
