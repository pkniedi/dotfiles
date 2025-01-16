# Install

Follow the instructions in [./docs/INSTALL.md](./docs/INSTALL.md) to install the system.


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
