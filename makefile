CONFIG_HOME:=$(HOME)/.config

.PHONY: install i3 polybar nvim sync starship alacritty

install: utils i3 polybar nvim starship zsh

zsh:
	which zsh &>/dev/null || sudo pacman -S zsh zsh-completions
	sudo chsh -s $$(which zsh)

utils:
	which xclip &>/dev/null || sudo pacman -S xclip
	which curl &>/dev/null || sudo pacman -S curl
	which git &>/dev/null || sudo pacman -S git


alacritty:
	which alacritty &>/dev/null || sudo pacman -S alacritty
	cp -r $(PWD)/alacritty $(CONFIG_HOME)



sync: 
	cp -r $(PWD)/zsh $(CONFIG_HOME) 
	cp $(PWD)/zsh/zshenv $(HOME)/.zshenv
	cp -r $(PWD)/nvim $(CONFIG_HOME) 
	cp -r $(PWD)/bin $(HOME)/bin 
	cp -r $(PWD)/i3 $(CONFIG_HOME) 
	cp -r $(PWD)/polybar $(CONFIG_HOME) 
	cp -r $(PWD)/nvim $(CONFIG_HOME) 
	cp -r $(PWD)/starship $(CONFIG_HOME)
	cp -r $(PWD)/kitty $(CONFIG_HOME)


starship:
	curl -sS https://starship.rs/install.sh | sh -s -- --bin-dir /data/data/com.termux/files/usr/bin

i3:
	which i3 &>/dev/null || sudo pacman -S i3-wm
	
polybar:
	which polybar &>/dev/null || sudo pacman -S polybar

nvim:
	which nvim &>/dev/null || sudo pacman -S nvim

