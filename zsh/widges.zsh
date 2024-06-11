# https://thevaluable.dev/zsh-line-editor-configuration-mouseless/

# function _toggle-colo {
#     grep onedark ~/.config/alacritty/colorscheme.toml &>/dev/null
#     if [[ $? -eq 0 ]];then
#         sed -i "s|onedark|alabaster|" ~/.config/alacritty/colorscheme.toml
#     else
#         sed -i "s|alabaster|onedark|" ~/.config/alacritty/colorscheme.toml
#     fi
#     touch ~/.config/alacritty/alacritty.toml
# }
# zle -N _toggle-colo
# bindkey '^t' _toggle-colo

function _prepend-sudo {
  if [[ $BUFFER != "sudo "* ]]; then
    BUFFER="sudo $BUFFER"; CURSOR+=5
  fi
}

zle -N _prepend-sudo
bindkey '^e' _prepend-sudo

function _trigger_fzf {
    pwd
}

zle -N _trigger_fzf
bindkey '^t' _trigger_fzf
