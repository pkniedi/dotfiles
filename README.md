# Install

First install all dependencies:
```bash
yay -S python3 ansible-core git make
```
The rest is handled in the Makefile:
```bash
make install # installs all packages and symlinks dotfiles
```
Be cautious when running the `install` target. 
I'm not sure whether ansible overwrites stuff already existing in ~/.config.

# Roles

cli: responsible for installing cli tools and symlinking dotfiles
privileged: do some privileged tasks which require root privileges
gui: install gui tools


# TODOs

- [ ] setup copying files for sddm

setup fonts correctly:
cp -r /usr/share/fonts ~/.local/share/  ??
setup sddm.conf file
there is a script in dotfiles repo where I yoinked the setup
