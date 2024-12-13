#!/usr/bin/env bash

#  _ _       _
# | (_)_ __ | | __
# | | | '_ \| |/ /
# | | | | | |   <
# |_|_|_| |_|_|\_\


PWD=$(dirname $(realpath $0))
source $PWD/env.sh


# This script is used to link the dotfiles to this github repo
# WARN: The two arrays must be in the same order!!



# TODO: change to maps
dirs_to_link=(
        $NVIM_CONFIG
        $ZSH_CONFIG
        $ZSHRC_FILE
        $HYPR_CONFIG
        $WAYBAR_CONFIG
        $WAYPAPER_CONFIG
        $KITTY_CONFIG
        $ZATHURA_CONFIG
        $FASTFETCH_CONFIG
        $TMUX_CONFIG
)

dir_repo_loc=(
        $REPO_DIR/nvim
        $REPO_DIR/zshrc
        $REPO_DIR/zshrc/.zshrc
        $REPO_DIR/hypr
        $REPO_DIR/waybar
        $REPO_DIR/waypaper
        $REPO_DIR/kitty
        $REPO_DIR/zathura
        $REPO_DIR/fastfetch
        $REPO_DIR/tmux/.tmux.conf
)


for ((i=0; i<${#dirs_to_link[@]}; i++)); do
        # SYMLINK
        # If there is an existing symlink, we just remove it under the assumption that we know where the old file/dir is
        if [ -L ${dirs_to_link[$i]} ]; then
                echo ":: Removing old symlink: " ${dirs_to_link[$i]}
                rm -rf ${dirs_to_link[$i]}
        fi
        # DIRS
        if [ -d ${dirs_to_link[$i]} ]; then
                        echo ":: Backing up dir: ${dirs_to_link[$i]}"
                        mv ${dirs_to_link[$i]} ${dirs_to_link[$i]}.bak
        fi
        # FILE
        if [ -f ${dirs_to_link[$i]} ]; then
                        echo ":: Backing up file: ${dirs_to_link[$i]}"
                        mv ${dirs_to_link[$i]} ${dirs_to_link[$i]}.bak
        fi
        ln -s ${dir_repo_loc[$i]} ${dirs_to_link[$i]}
done
