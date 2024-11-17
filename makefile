GUI_PACKAGES_PACMAN:=firefox wayland kitty
GUI_PACKAGES_YAY:=waypaper
CLI_PACKAGES_PACMAN:=zsh neovim
CLI_PACKAGES_YAY:=zsh neovim

CONFIG_HOME:=$(HOME)/.config
DOTFILES:=$(PWD)


# -----------------------------------------------
# Installations

test: install_install_requirements zsh

install_requirements:
	@echo ":: Installing requirements..."
	@sudo ./helpers/install-requirements.sh

install_packages:
	@echo ":: Installing packages..."
	@sudo ./helpers/install-packages.sh

pull_all: zsh_pull nvim_pull

all: install_packages cli gui



sync:
	@echo ":: Syncing dotfiles..."
	@./helpers/sync-repo.sh

intstall:
	@sudo ./helpers/install-requirements.sh
	@sudo ./helpers/install-packages.sh


install_light: 
	@echo ":: Setting up nvim and zsh..."
	@sudo ./helpers/install-requirements.sh
	@sudo ./helpers/install-zsh.sh
	@sudo ./helpers/install-nvim.sh

pull:
	@./helpers/pull-configs.sh
