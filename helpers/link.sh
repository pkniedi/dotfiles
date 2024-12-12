#!/usr/bin/env bash

#  _ _       _
# | (_)_ __ | | __
# | | | '_ \| |/ /
# | | | | | |   <
# |_|_|_| |_|_|\_\


PWD=$(dirname $(realpath $0))
source $PWD/env.sh



# This script is used to link the dotfiles to this github repo



# Do the same but without the backup check
# ln -s $REPO_DIR/nvim $NVIM_CONFIG
# ln -s $REPO_DIR/zshrc $CONFIG/zshrc
# ln -s $REPO_DIR/zshrc/.zshrc $HOME/.zshrc
# ln -s $REPO_DIR/hypr $CONFIG/hypr
# ln -s $REPO_DIR/waybar $CONFIG/waybar
# ln -s $REPO_DIR/waypaper $CONFIG/waypaper
# ln -s $REPO_DIR/kitty $CONFIG/kitty
# ln -s $REPO_DIR/zathura $CONFIG/zathura
# ln -s $REPO_DIR/fastfetch $CONFIG/fastfetch


to_link=(
        $NVIM_CONFIG
        $ZSH_CONFIG
        $HYPR_CONFIG
        $WAYBAR_CONFIG
        $WAYPAPER_CONFIG
        $KITTY_CONFIG
        $ZATHURA_CONFIG
        $FASTFETCH_CONFIG
)

repo_loc=(
        $REPO_DIR/nvim
        $REPO_DIR/zshrc
        $REPO_DIR/hypr
        $REPO_DIR/waybar
        $REPO_DIR/waypaper
        $REPO_DIR/kitty
        $REPO_DIR/zathura
        $REPO_DIR/fastfetch
)


for ((i=0; i<${#to_link[@]}; i++)); do
        if [ -L ${to_link[$i]} ];
        then
                echo ":: Removing old symlink: " ${to_link[$i]}
                rm -rf ${to_link[$i]}
        else if [ -d ${to_link[$i]} ]; then
                        echo ":: Backing up ${to_link[$i]}"
                        mv ${to_link[$i]} ${to_link[$i]}.bak
                fi
        fi


         ln -s ${repo_loc[$i]} ${to_link[$i]}
done
# Special treatment for zshrc

if [ -L $ZSHRC_FILE ];
then
        echo ":: Removing old zsh init file symlink"
        rm -rf $ZSHRC_FILE
else if [ -d $ZSHRC_FILE ]; then
                echo ":: Backing up zsh init file"
                mv $ZSHRC_FILE  $ZSH_INIT_FILE.bak
        fi
fi
ln -s $REPO_DIR/zshrc/.zshrc $HOME/.zshrc

exit

if [ -d $NVIM_CONFIG ]; then
if [ -L $NVIM_CONFIG ];
       then
                echo ":: Removing old nvim config symlink"
                rm -rf $NVIM_CONFIG
        else
                echo ":: Backing up nvim config"
                mv $NVIM_CONFIG $NVIM_CONFIG.bak
fi
fi
ln -s $REPO_DIR/nvim $CONFIG


if [ -d $ZSH_CONFIG ]; then
if [ -L $ZSH_CONFIG ];
       then
                echo ":: Removing old zsh config symlink"
                rm -rf $ZSH_CONFIG
        else
                echo ":: Backing up zsh config"
                mv $ZSH_CONFIG $ZSH_CONFIG.bak
fi
fi
ln -s $REPO_DIR/zshrc $CONFIG/zshrc

if [ -d $ZSHRC_FILE ]; then
if [ -L $ZSHRC_FILE ];
       then
                echo ":: Removing old zsh init file symlink"
                rm -rf $ZSHRC_FILE
        else
                echo ":: Backing up zsh init file"
                mv $ZSHRC_FILE  $ZSH_INIT_FILE.bak
fi
fi
ln -s $REPO_DIR/zshrc/.zshrc $HOME/.zshrc

if [ -d $HYPR_CONFIG ]; then
if [ -L $HYPR_CONFIG ];
       then
                echo ":: Removing old hyper config symlink"
                rm -rf $HYPR_CONFIG
        else
                echo ":: Backing up hyper config"
                mv $HYPR_CONFIG $HYPR_CONFIG.bak
fi
fi
ln -s $REPO_DIR/hypr $CONFIG/hypr

if [ -d $WAYBAR_CONFIG ]; then
if [ -L $WAYBAR_CONFIG ];
       then
                echo ":: Removing old waybar config symlink"
                rm -rf $WAYBAR_CONFIG
        else
                echo ":: Backing up waybar config"
                mv $WAYBAR_CONFIG $WAYBAR_CONFIG.bak
fi
fi
ln -s $REPO_DIR/waybar $CONFIG/waybar

if [ -d $WAYPAPER_CONFIG ]; then
if [ -L $WAYPAPER_CONFIG ];
       then
                echo ":: Removing old waypaper config symlink"
                rm -rf $WAYPAPER_CONFIG
        else
                echo ":: Backing up waypaper config"
                mv $WAYPAPER_CONFIG $WAYPAPER_CONFIG.bak
fi
fi
ln -s $REPO_DIR/waypaper $CONFIG/waypaper

if [ -d $KITTY_CONFIG ]; then
if [ -L $KITTY_CONFIG ];
       then
                echo ":: Removing old kitty config symlink"
                rm -rf $KITTY_CONFIG
        else
                echo ":: Backing up kitty config"
                mv $KITTY_CONFIG $KITTY_CONFIG.bak
fi
fi
ln -s $REPO_DIR/kitty $CONFIG/kitty

