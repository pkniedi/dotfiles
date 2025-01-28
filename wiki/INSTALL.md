# Prerequisites

All instructions in the arch wiki [installation guide](https://wiki.archlinux.org/title/Installation_guide). Make sure that the `base-devel` and `git` packages are installed:

```bash
sudo pacman --needed -S base-devel git
```

The `base-devel` package contains tools like `make` and `makepkg`.



# Manuel
## Install yay

Clone the yay repository from the AUR and navigate to the directory:


```bash
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
```

for further information, [visit me](https://github.com/Jguer/yay?tab=readme-ov-file)


## Install ansible

Since ansible-core lists python as a dependency, it is sufficient to run the following command:

```bash
yay -S ansible-core
```

The rest is handled using make:
```bash
make install # installs all packages and symlinks dotfiles
```

Be cautious when running the `install` target. I'm not sure whether ansible overwrites stuff already existing in ~/.config. (I think it doesn't)


# Automated

run

```bash
./setup.sh
```
