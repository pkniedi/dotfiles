CONFIG_HOME:=$(HOME)/.config
CMD_PCK_MANAGER:=pacman -S --noconfirm

.PHONY: install i3 polybar nvim sync starship utils md cp-dirs


# NOTE: run make install only from install script
install: utils i3 polybar nvim starship zsh kitty git

test:
	whoami

starship:
	which starship &>/dev/null || $(CMD_PCK_MANAGER) starship

i3:
	which i3 &>/dev/null || $(CMD_PCK_MANAGER) i3-wm

polybar:
	which polybar &>/dev/null || $(CMD_PCK_MANAGER) polybar

nvim:
	which nvim &>/dev/null || $(CMD_PCK_MANAGER) nvim


zsh:
	which zsh &>/dev/null || $(CMD_PCK_MANAGER) zsh zsh-completions
	sudo chsh -s $$(which zsh) 
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


utils:
	which git &>/dev/null || $(CMD_PCK_MANAGER) git
	which curl &>/dev/null || $(CMD_PCK_MANAGER) curl
	which xclip &>/dev/null || $(CMD_PCK_MANAGER) xclip
	fc-list | grep -i "Hack Nerd Font"  || $(CMD_PCK_MANAGER) ttf-hack-nerd


kitty:
	which kitty &>/dev/null || $(CMD_PCK_MANAGER) kitty

sync: md cp-dirs

md:
	@echo "Creating directories..."
	mkdir -p $(CONFIG_HOME)/zsh 
	mkdir -p $(CONFIG_HOME)/nvim 
	mkdir -p $(CONFIG_HOME)/bin
	mkdir -p $(CONFIG_HOME)/i3 
	mkdir -p $(CONFIG_HOME)/polybar 
	mkdir -p $(CONFIG_HOME)/nvim 
	mkdir -p $(CONFIG_HOME)/starship 
	mkdir -p $(CONFIG_HOME)/kitty 

cp-dirs:
	@echo "Copying configuration files..."
	rsync -av --progress $(PWD)/zsh $(CONFIG_HOME) 
	rsync -av --progress $(PWD)/zsh/zshenv $(HOME)/.zshenv
	rsync -av --progress $(PWD)/nvim $(CONFIG_HOME) 
	rsync -av --progress $(PWD)/bin $(HOME)
	rsync -av --progress $(PWD)/i3 $(CONFIG_HOME) 
	rsync -av --progress $(PWD)/polybar $(CONFIG_HOME) 
	rsync -av --progress $(PWD)/nvim $(CONFIG_HOME) 
	rsync -av --progress $(PWD)/starship $(CONFIG_HOME)
	rsync -av --progress $(PWD)/kitty $(CONFIG_HOME)
