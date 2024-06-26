#!/bin/bash

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


# TODO: zsh-syntax-highlighting: needs installation with specific package manager
# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md

# TODO: zsh-vi-mode needs installation with specific package manager
# git clone https://github.com/jeffreytse/zsh-vi-mode.git $ZSH/custom/plugins/.zsh-vi-mode
# echo "source $ZSH/custom/plugins/.zsh-vi-mode/zsh-vi-mode.plugin.zsh" >> $HOME/.config/zsh/.zshrc


# zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search


if [[ ! -f $HOME/.config/zsh/.oh-my-zsh/oh-my-zsh.sh ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
