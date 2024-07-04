#!/bin/bash


ZDOTDIR=$HOME/.config/zsh
ZSH_HOME=$ZDOTDIR
ZSH="$HOME/.config/zsh/.oh-my-zsh"
STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
CONFIG_HOME=$HOME/.config
XDG_CONFIG_HOME=$CONFIG_HOME
ZSH_CUSTOM=$ZSH/custom

if [[ ! -f $ZSH/oh-my-zsh.sh ]]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/jeffreytse/zsh-vi-mode \
  $ZSH/plugins/zsh-vi-mode

git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
