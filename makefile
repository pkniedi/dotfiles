CONFIG_HOME:=$(HOME)/.config

.PHONY: install i3 polybar nvim sync starship alacritty

install: utils i3 polybar nvim starship zsh kitty alacritty

zsh:
	which zsh &>/dev/null || sudo pacman -S zsh zsh-completions
	sudo chsh -s $$(which zsh)

utils:
	which xclip &>/dev/null || sudo pacman -S xclip
	which curl &>/dev/null || sudo pacman -S curl
	which git &>/dev/null || sudo pacman -S git
	fc-list | grep -i "Hack Nerd Font"  || sudo pacman -S ttf-hack-nerd


alacritty:
	which alacritty &>/dev/null || sudo pacman -S alacritty


kitty:
	which kitty &>/dev/null || sudo pacman -S kitty


sync: cp-dirs reload-config

cp-dirs:
	cp -r $(PWD)/zsh $(CONFIG_HOME) 
	cp $(PWD)/zsh/zshenv $(HOME)/.zshenv
	cp -r $(PWD)/nvim $(CONFIG_HOME) 
	cp -r $(PWD)/bin $(HOME)/bin 
	cp -r $(PWD)/i3 $(CONFIG_HOME) 
	cp -r $(PWD)/polybar $(CONFIG_HOME) 
	cp -r $(PWD)/nvim $(CONFIG_HOME) 
	cp -r $(PWD)/starship $(CONFIG_HOME)
	cp -r $(PWD)/alacritty $(CONFIG_HOME)
	cp -r $(PWD)/kitty $(CONFIG_HOME)


reload-config:
	i3-msg restart
	touch $(CONFIG_HOME)/alacritty/alacritty.toml

starship:
	curl -sS https://starship.rs/install.sh | sh -s -- --bin-dir /data/data/com.termux/files/usr/bin

i3:
	which i3 &>/dev/null || sudo pacman -S i3-wm


polybar: sync
	which polybar &>/dev/null || sudo pacman -S polybar

nvim:
	which nvim &>/dev/null || sudo pacman -S nvim
