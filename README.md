# Dotfiles


My dotfiles for the following appli


# Setup

This repository contains my current arch linux setup.

The configuartion files for for the following applications are included in their respective directories:

- [Alacritty](./alacritty/README.md)
- [Kitty](./kitty/README.md)
- [Neovim](./nvim/README.md)
- [Waybar](./waybar/README.md)
- [Polybar](./polybar/README.md)
- [Firefox](./firefox/README.md)
- [Zsh](./zsh/README.md)
- [I3](./i3/README.md)


wal is used for automatically generating color schemes for the terminal and other applications. 





Contains some shell scripts which, some of which are required for the other configuarations to work.

Assumes all packages are already installed.

# Installation

## ZSH

```bash
make zsh                # install all zsh dependencies and sync the zsh configuration
make zsh_dependencies   # install all zsh dependencies
make zsh_sync           # sync the zsh configuration
```





Run the following command to sync everything:

```sh
git clone https://github.com/pkniedi/dotfiles.git $HOME/dotfiles && make --file=$HOME/dotfiles/makefile sync
```


# Helper scripts

Located in helpers directory.

install-zsh-dependencies.sh: Installs all zsh dependencies (duh)
    -   oh-my-zsh
    -   zsh-autosuggestions
    -   zsh-syntax-highlighting



# Applications

## zsh

run the following command to sync the nvim configuration in this repository with the nvim configuration in the home directory:

```bash
make zsh_sync
```

## nvim


run the following command to sync the nvim configuration in this repository with the nvim configuration in the home directory:

```bash
make nvim_sync
```

run the following command to start nvim with the configuration in this repository:

```bash
nvim -u init.lua
```





# Colors

https://github.com/dylanaraps/pywal?tab=readme-ov-file
