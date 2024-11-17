# Dotfiles


My current arch linux setup/dotfiles.
nvim & zsh configuration files work, rest not done yet.

# Setup

Only run make inside the root of the repository.
The configuartion files for for the following applications are included in their respective directories:

- [Kitty](./kitty/README.md)
- [Neovim](./nvim/README.md)
- [Waybar](./waybar/README.md)
- [Polybar](./polybar/README.md)
- [Firefox](./firefox/README.md)
- [Zsh](./zsh/README.md)
- [I3](./i3/README.md)


wal is used for automatically generating color schemes for the terminal and other applications. 

# Installation

```bash
make install 

```

## Lightweight installation

Only install zsh and nvim with dependencies



```bash
make install_light
```


# Helper scripts

Located in helpers directory.

-   install-zsh-dependencies.sh: Installs all zsh dependencies (oh-my-zsh, zsh-autosuggestions, zsh-syntax-highlighting)


# Applications

## zsh

run the following command to sync the nvim configuration in this repository with the nvim configuration in the home directory:

```bash
make zsh_sync
```

## nvim

sync the nvim config:
```bash
make nvim_sync
```

# TODO

- [ ] change wallpapers to script which downloads instead of storing them in the repository
-   [ ] cmd to sync everything
-   [ ] Add [pywal](https://github.com/dylanaraps/pywal?tab=readme-ov-file) for the applications
