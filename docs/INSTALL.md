# Prerequisites

All instructions in the arch wiki [installation guide](https://wiki.archlinux.org/title/Installation_guide). Make sure that the `base-devel` and `git` packages are installed:

```bash
sudo pacman --needed -S base-devel git
```

The `base-devel` package contains tools like `make` and `makepkg`.


# Install yay

Clone the yay repository from the AUR and navigate to the directory:

```bash
git clone https://aur.archlinux.org/yay.git
cd yay
```

Build and install the package and follow the on-screen instructions:
```bash
makepkg -si
```

After successful installation, remove the yay directory:
```bash
cd ..
rm -rf yay
```


# Install ansible

Since ansible-core lists python as a dependency, it is sufficient to run the following command:

```bash
yay -S ansible-core
```

The rest is handled using make:
```bash
make install # installs all packages and symlinks dotfiles
```

Be cautious when running the `install` target. I'm not sure whether ansible overwrites stuff already existing in ~/.config. (I think it doesn't)
