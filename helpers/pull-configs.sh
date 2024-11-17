#!/usr/bin/env bash


PWD=$(dirname $(realpath $0))
source $PWD/env.sh


if [ -d $ZSH_CONFIG ]; then
  echo "Pulling zsh config"
  rsync -a --recursive $ZSH_CONFIG $REPO_DIR
  rsync -a $HOME/.zshrc $REPO_DIR/zshrc/.zshrc
  rsync -a $HOME/.warprc $REPO_DIR/zshrc/.warprc
fi

if [ -d $NVIM_CONFIG ]; then
  echo "Pulling nvim config"
  rsync -a --recursive $NVIM_CONFIG $REPO_DIR
fi

if [ -d $HYPR_CONFIG ]; then
  echo "Pulling hyper config"
  rsync -a --recursive $HYPR_CONFIG $REPO_DIR
fi


if [ -d $WAYBAR_CONFIG ]; then
  echo "Pulling waybar config"
  rsync -a --recursive $WAYBAR_CONFIG $REPO_DIR
fi

if [ -d $WAYPAPER_CONFIG ]; then
  echo "Pulling waypaper config"
  rsync -a --recursive $WAYPAPER_CONFIG $REPO_DIR
fi

if [ -d $KITTY_CONFIG ]; then
  echo "Pulling kitty config"
  rsync -a --recursive $KITTY_CONFIG $REPO_DIR
fi


if [ -d $ZATHURA_CONFIG ]; then
  echo "Pulling zathura config"
  rsync -a --recursive $ZATHURA_CONFIG $REPO_DIR
fi


if [ -d $FASTFETCH_CONFIG ]; then
  echo "Pulling fastfetch config"
  rsync -a --recursive $FASTFETCH_CONFIG $REPO_DIR
fi

