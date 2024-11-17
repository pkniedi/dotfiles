#!/usr/bin/env bash


REPO_DIR=$(dirname $(dirname $(realpath $0)))

CONFIG=$HOME/.config
ZSH_CONFIG=$CONFIG/zshrc
NVIM_CONFIG=$CONFIG/nvim
HYPR_CONFIG=$CONFIG/hypr
WAYBAR_CONFIG=$CONFIG/waybar
WAYPAPER_CONFIG=$CONFIG/waypaper
KITTY_CONFIG=$CONFIG/kitty
ZATHURA_CONFIG=$CONFIG/zathura
FASTFETCH_CONFIG=$CONFIG/fastfetch


if [ -d $ZSH_CONFIG ]; then
        echo ":: Copying zsh configuration files..."
        echo ":: Copying .zshrc to ~"
        rsync -a $REPO_DIR/zshrc/.zshrc $HOME/.zshrc
        mkdir -p $CONFIG/zshrc
        echo ":: Copying dotfiles/zshrc to ~/.config"
        rsync -a --recursive $REPO_DIR/zshrc $CONFIG
        rm $CONFIG/zshrc/.zshrc
        echo ":: Copying .warprc to ~"
        rsync -a  $REPO_DIR/zshrc/.warprc $HOME/.warprc
fi

if [ -d $NVIM_CONFIG ]; then
	echo ":: Copying nvim configuration files..."
	mkdir -p $CONFIG/nvim
	rsync -a $REPO_DIR/nvim $CONFIG
fi

if [ -d $HYPR_CONFIG ]; then
        echo ":: Copying hyper configuration files..."
        mkdir -p $CONFIG/hypr
        rsync -a $REPO_DIR/hypr $CONFIG
fi


if [ -d $WAYBAR_CONFIG ]; then
        echo ":: Copying waybar configuration files..."
        mkdir -p $CONFIG/waybar
        rsync -a $REPO_DIR/waybar $CONFIG
fi

if [ -d $WAYPAPER_CONFIG ]; then
        echo ":: Copying waypaper configuration files..."
        mkdir -p $CONFIG/waypaper
        rsync -a $REPO_DIR/waypaper $CONFIG
fi

if [ -d $KITTY_CONFIG ]; then
        echo ":: Copying kitty configuration files..."
        mkdir -p $CONFIG/kitty
        rsync -a $REPO_DIR/kitty $CONFIG
fi

if [ -d $ZATHURA_CONFIG ]; then
        echo ":: Copying zathura configuration files..."
        mkdir -p $CONFIG/zathura
        rsync -a $REPO_DIR/zathura $CONFIG
fi

if [ -d $FASTFETCH_CONFIG ]; then
        echo ":: Copying fastfetch configuration files..."
        mkdir -p $CONFIG/fastfetch
        rsync -a $REPO_DIR/fastfetch $CONFIG
fi


