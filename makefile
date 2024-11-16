GUI_PACKAGES_PACMAN:=firefox wayland kitty
GUI_PACKAGES_YAY:=waypaper
CLI_PACKAGES_PACMAN:=zsh neovim
CLI_PACKAGES_YAY:=zsh neovim

yay_flags:=-S --noconfirm --needed
pacman_flags:=-S --noconfirm --needed


CONFIG_HOME:=$(HOME)/.config
DOTFILES:=$(PWD)


# -----------------------------------------------
# Installations

test: requirements zsh

requirements:
	@echo ":: Installing requirements..."
	@sudo ./helpers/install-requirements.sh



pull_all: zsh_pull nvim_pull

all: requirements cli gui


yay: 
	chmod +x ./install-yay.sh
	sudo ./install-yay.sh

cli: yay
	echo ":: Installing CLI packages"
	@for package in $(CLI_PACKAGES_PACMAN); do \
		echo ":: Installing $$package"; \
		sudo pacman $(pacman_flags) $$package; \
	done

	@for package in $(CLI_PACKAGES_YAY); do \
		echo ":: Installing $$package"; \
		yay $(yay_flags) $$package; \
	done

gui: yay
	echo ":: Installing GUI packages"
	@for package in $(GUI_PACKAGES_PACMAN); do \
		echo ":: Installing $$package"; \
		sudo pacman $(pacman_flags) $$package; \
	done

	@for package in $(GUI_PACKAGES_YAY); do \
		echo ":: Installing $$package"; \
		yay $(yay_flags) $$package; \
	done

# -----------------------------------------------


.PHONY: sync md cp-dirs clean zsh nvim bin i3 polybar nvim kitty alacritty

sync: zsh nvim bin i3 polybar nvim kitty alacritty




# -----------------------------------------------
# ZSH
# Copies


# Install oh-my-zsh
# Install zsh-autosuggestions
# Install zsh-syntax-highlighting
#
zsh: zsh_dependencies zsh_sync
single_zsh: requirements zsh_sync zsh_dependencies

zsh_dependencies:
	@echo ":: Installing zsh dependencies..."
	@sudo ./helpers/install-zsh-dependencies.sh

zsh_sync:
	figlet -f ./figlet-fonts/3D-ASCII.flf "ZSH"
	@echo ":: Copying zsh configuration files..."
	@echo ":: Copying .zshrc to ~"
	@rsync -a $(DOTFILES)/zshrc/.zshrc $(HOME)/.zshrc
	@mkdir -p $(CONFIG_HOME)/zshrc
	@echo ":: Copying dotfiles/zshrc to ~/.config"
	@rsync -a  --recursive $(DOTFILES)/zshrc $(CONFIG_HOME)
	@rm $(CONFIG_HOME)/zshrc/.zshrc
	@echo ":: Copying .warprc to ~"
	@rsync -a  $(DOTFILES)/zshrc/.warprc $(HOME)
	@echo ":: Running install script..."

zsh_pull:
	@echo ":: Pulling zsh configuration files..."
	@cp -r $(CONFIG_HOME)/zshrc/* $(DOTFILES)/zshrc
	@rsync -a $(HOME)/.zshrc $(DOTFILES)/zshrc
	@rsync -a $(HOME)/.warprc $(DOTFILES)/zshrc

# -----------------------------------------------
#  nvim

single_nvim: requirements nvim_sync nvim_dependencies
	
nvim_dependencies:
	@echo ":: Installing nvim dependencies..."
	@sudo ./helpers/install-nvim-dependencies.sh

nvim_sync:
	@figlet -f ./figlet-fonts/3D-ASCII.flf "NVIM"
	@echo ":: Copying nvim configuration files..."
	@mkdir -p $(CONFIG_HOME)/nvim
	@rsync -a $(DOTFILES)/nvim $(CONFIG_HOME)


nvim_pull:
	@echo ":: Pulling nvim configuration files..."
	@rsync -a $(CONFIG_HOME)/nvim $(DOTFILES)


# -----------------------------------------------
#  KITTY


kitty: kitty_dependencies kitty_sync
single_kitty: requirements kitty_depen kitty_sync

kitty_dependencies:
	@echo ":: Installing kitty..."
	@sudo pacman $(pacman_flags) kitty

kitty_sync:
	figlet -f ./figlet-fonts/3D-ASCII.flf "KITTY"
	@echo ":: Copying kitty configuration files..."
	@mkdir -p $(CONFIG_HOME)/kitty
	@rsync -a $(DOTFILES)/kitty $(CONFIG_HOME)


kitty_pull:
	@echo ":: Pulling kitty configuration files..."
	@rsync -a $(CONFIG_HOME)/kitty $(DOTFILES)


# -----------------------------------------------
#  wal

wal:

wal: wal_dependencies wal_sync




# -----------------------------------------------
#  wayland
#
#
