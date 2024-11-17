#!/usr/bin/env bash

#             _
#  _ ____   _(_)_ __ ___
# | '_ \ \ / / | '_ ` _ \
# | | | \ V /| | | | | | |
# |_| |_|\_/ |_|_| |_| |_|


source library.sh

# https://wiki.archlinux.org/title/Language_Server_Protocol
packages=(
"neovim"
"lua-language-server"
"bashls"
"clang"
"python-language-server"
"texlab"
"yamlls"
)

aur_packages=(
"vim-language-server"
"diagnostic-languageserver"
)


echo "Installing neovim packages..."

_installPackages "${packages[@]}";
_installYay "${aur_packages[@]}";
