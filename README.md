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

# TODO

- docs





# Colors

The colorscheme is generated using wal. The colors are stored in the `wal` directory. The colors are generated using the `wal` command. The colors are then stored in the `wal`
directory. The colors are then used in the configuration files for the various applications.

https://github.com/dylanaraps/pywal?tab=readme-ov-file




# ZSH configuration

The makefile in the root directory copies
-   .zshrc to ~/.zshrc
-   all other files in zsh to ~/.config/zshrc
