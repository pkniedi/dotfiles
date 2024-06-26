#!/bin/bash

if [[ ! -f $HOME/.config/zsh/.oh-my-zsh/oh-my-zsh.sh ]]; then
    "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
