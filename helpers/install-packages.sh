#!/usr/bin/env bash


source library.sh

packages=(
"hyprland"
"waybar"
"rofi-wayland"
"alacritty"
"dunst"
"thunar"
"xdg-desktop-portal-hyprland"
"qt5-wayland"
"qt6-wayland"
"hyprpaper"
"hyprlock"
"firefox"
"ttf-font-awesome"
"fastfetch"
"ttf-fira-sans"
"ttf-fira-code"
"ttf-firacode-nerd"
"fuse2"
"gtk4"
"libadwaita"
"jq"
"python-gobject"
"kitty"

# Neovim
"neovim"
"lua-language-server"
"bashls"
"clang"
"python-language-server"
"texlab"
"yamlls"

# zsh
"figlet"
"fastfetch"
"zsh"
"zsh-syntax-highlighting"
"fzf"
)

aur_packages=(
"wlogout"

# Neovim
"vim-language-server"
"diagnostic-languageserver"
)

_installPackages "${packages[@]}";
_installYay "${aur_packages[@]}";

./install-zsh.sh
./install-nvim.sh
