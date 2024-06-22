#!/bin/sh

# Run this script with root privileges.

make install CMD_PCK_MANAGER='sudo pacman -S --noconfirm'
make sync
