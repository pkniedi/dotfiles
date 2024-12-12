#!/usr/bin/env bash

#          _
#  _______| |__
# |_  / __| '_ \
#  / /\__ \ | | |
# /___|___/_| |_|


PWD=$(dirname $(realpath $0))
source $PWD/library.sh

packages=(
"figlet"
"fastfetch"
"zsh"
"zsh-syntax-highlighting"
"fzf"
)

pacman -S --noconfirm --needed "${packages[@]}"

if ! [ -d $HOME/.oh-my-zsh ]; then
        echo "Installing oh-my-zsh"
        git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
fi

if ! [ -d $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
        # clone zsh-autosuggestions
        git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi
