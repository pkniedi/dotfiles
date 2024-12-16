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

# Directories
export RES_DIR=$HOME/resources


# Directories to backup
export BACKUP_DIRS=(
        $HOME/notes/zettelkasten
        $HOME/documents
)

