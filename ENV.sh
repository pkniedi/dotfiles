#  _____ _   ___     __
# | ____| \ | \ \   / /
# |  _| |  \| |\ \ / /
# | |___| |\  | \ V /
# |_____|_| \_|  \_/


# Do not change the location of this file

export REPO_DIR=$(dirname $(dirname $(realpath $0)))

# Actual locations according to docs

export CONFIG=$HOME/.config
export ZSH_CONFIG=$CONFIG/zshrc
export ZSHRC_FILE=$HOME/.zshrc
export NVIM_CONFIG=$CONFIG/nvim
export HYPR_CONFIG=$CONFIG/hypr
export WAYBAR_CONFIG=$CONFIG/waybar
export WAYPAPER_CONFIG=$CONFIG/waypaper
export KITTY_CONFIG=$CONFIG/kitty
export ZATHURA_CONFIG=$CONFIG/zathura
export FASTFETCH_CONFIG=$CONFIG/fastfetch
export TMUX_CONFIG=$HOME/.tmux.conf

export CACHE_DIR=$HOME/.cache/dotfiles

export EDITOR=nvim
export PATH="$PATH:/usr/lib/ccache/bin:$HOME/.local/bin:/usr/local/texlive/2023/bin/x86_64-linux:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/bin/zsh-scripts"
export ZSH="$HOME/.oh-my-zsh"

# Directories
export RES_DIR=$HOME/resources


# Directories to backup
export BACKUP_DIRS=(
        $HOME/notes/zettelkasten
        $HOME/documents
)
