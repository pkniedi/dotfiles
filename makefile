CONFIG_HOME:=$(HOME)/.test-config

help:
	@echo "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\\033[36m\1\\033[m:\2/' | column -c2 -t -s :)"

install: ## Install dotfiles
	@echo "Installing dotfiles..."
	./link_dirs.sh

.PHONY: all zsh nvim build_reqs pyenv

all: zsh nvim
	@echo "All done"

zsh:
	@echo "Installing Zsh..."
	which zsh &>/dev/null || sudo pacman -S zsh zsh-completions
	cp -r $(PWD)/zsh $(CONFIG_HOME) 
	cp $(PWD)/zshenv $(HOME)/.zshenv
	sudo chsh -s $$(which zsh)

utils:
	which xclip &>/dev/null || sudo pacman -S xclip
	which ssh &>/dev/null || sudo pacman -S ssh

alacritty:
	which alacritty &>/dev/null || sudo pacman -S alacritty
	cp -r $(PWD)/alacritty $(CONFIG_HOME)


bin:


# pacin: zsh
pacin: 
	which git &>/dev/null || sudo pacman -S git


i3:
	which i3 &>/dev/null || sudo pacman -S i3-wm
	cp -r $(PWD)/i3 $(CONFIG_HOME) 
	
polybar:
	which polybar &>/dev/null || sudo pacman -S polybar
	cp -r $(PWD)/polybar $(CONFIG_HOME) 

nvim:
	which nvim &>/dev/null || sudo pacman -S nvim
	cp -r $(PWD)/nvim $(CONFIG_HOME) 


show:
	ls $(CONFIG_HOME)

sync:
	@echo "Syncing..."


rm:
	rm -rf $(CONFIG_HOME)/alacritty 
	rm -rf $(CONFIG_HOME)/i3 
	rm -rf $(CONFIG_HOME)/polybar 
	rm -rf $(CONFIG_HOME)/zsh 
	rm -rf $(CONFIG_HOME)/nvim 
