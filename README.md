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



## Arch (btw)

```bash
make arch_install 
```

## Lightweight installation

Only install zsh and nvim with dependencies

```bash
make arch_install_light
```


# TODO

- [ ] change wallpapers to script which downloads instead of storing them in the repository
-   [ ] cmd to sync everything
-   [ ] Add [pywal](https://github.com/dylanaraps/pywal?tab=readme-ov-file) for the applications
-   [ ] Add rofi
-  [ ] Add link-restore script
-   [ ] make installs platform independent
-   [ ] synch files with incrontab 
-   [ ] change to stow dirs:
    -   DONE: nvim, kitty, fastfetch, tmux, zathura, zshrc


# tmux
[plugin manager](https://github.com/tmux-plugins/tpm)
