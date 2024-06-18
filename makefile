CONFIG_HOME:=$(HOME)/.config

.PHONY: install i3 polybar nvim sync starship alacritty utils md cp-dirs

install: utils i3 polybar nvim starship zsh kitty alacritty

zsh:
	which zsh &>/dev/null || sudo pacman -S zsh zsh-completions
	sudo chsh -s $$(which zsh) 
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

utils:
	which xclip &>/dev/null || sudo pacman -S xclip
	which curl &>/dev/null || sudo pacman -S curl
	fc-list | grep -i "Hack Nerd Font"  || sudo pacman -S ttf-hack-nerd


alacritty:
	which alacritty &>/dev/null || sudo pacman -S alacritty


kitty:
	which kitty &>/dev/null || sudo pacman -S kitty


sync: md cp-dirs reload-config


md:
	mkdir -p $(CONFIG_HOME)/zsh 
	mkdir -p $(CONFIG_HOME)/nvim 
	mkdir -p $(CONFIG_HOME)/bin
	mkdir -p $(CONFIG_HOME)/i3 
	mkdir -p $(CONFIG_HOME)/polybar 
	mkdir -p $(CONFIG_HOME)/nvim 
	mkdir -p $(CONFIG_HOME)/starship 
	mkdir -p $(CONFIG_HOME)/alacritty 
	mkdir -p $(CONFIG_HOME)/kitty 

cp-dirs:
	rsync -av --progress $(PWD)/zsh $(CONFIG_HOME) 
	rsync -av --progress $(PWD)/zsh/zshenv $(HOME)/.zshenv
	rsync -av --progress $(PWD)/nvim $(CONFIG_HOME) 
	rsync -av --progress $(PWD)/bin $(HOME)
	rsync -av --progress $(PWD)/i3 $(CONFIG_HOME) 
	rsync -av --progress $(PWD)/polybar $(CONFIG_HOME) 
	rsync -av --progress $(PWD)/nvim $(CONFIG_HOME) 
	rsync -av --progress $(PWD)/starship $(CONFIG_HOME)
	rsync -av --progress $(PWD)/alacritty $(CONFIG_HOME)
	rsync -av --progress $(PWD)/kitty $(CONFIG_HOME)


reload-config:
	i3-msg restart &>/dev/null
	touch $(CONFIG_HOME)/alacritty/alacritty.toml

starship:
	curl -sS https://starship.rs/install.sh | sh -s -- --bin-dir /data/data/com.termux/files/usr/bin

i3:
	which i3 &>/dev/null || sudo pacman -S i3-wm

polybar:
	which polybar &>/dev/null || sudo pacman -S polybar

nvim:
	which nvim &>/dev/null || sudo pacman -S nvim
