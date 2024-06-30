CONFIG_HOME:=$(HOME)/.config
ZSH:=$(CONFIG_HOME)/zsh/.oh-my-zsh

.PHONY: sync md cp-dirs clean zsh nvim bin i3 polybar nvim kitty alacritty

sync: zsh nvim bin i3 polybar nvim kitty alacritty


test:
	@echo $(USER)

omz:
	mkdir -p $(CONFIG_HOME)/zsh 
	chmod +x ./omz-bootstrap.sh && ./omz-bootstrap.sh

zsh: 
	read input
	mkdir -p $(CONFIG_HOME)/zsh 
	rsync -av --progress $(PWD)/zsh $(CONFIG_HOME) 
	rsync -av --progress $(PWD)/zsh/zshenv $(HOME)/.zshenv
	rsync -av --progress $(PWD)/zsh/.warprc $(HOME)
	rm $(HOME)/.zshrc
	rm $(HOME)/.zshrc.pre-oh-my-zsh
	rm -rf $(HOME)/.oh-my-zsh


bin:
	mkdir -p $(HOME)/bin
	rsync -av --progress $(PWD)/bin $(HOME)

i3: 
	mkdir -p $(CONFIG_HOME)/i3 
	rsync -av --progress $(PWD)/i3 $(CONFIG_HOME) 


polybar: 
	mkdir -p $(CONFIG_HOME)/polybar 
	rsync -av --progress $(PWD)/polybar $(CONFIG_HOME) 


nvim: 
	mkdir -p $(CONFIG_HOME)/nvim 
	rsync -av --progress $(PWD)/nvim $(CONFIG_HOME) 

kitty: 
	mkdir -p $(CONFIG_HOME)/kitty 
	rsync -av --progress $(PWD)/kitty $(CONFIG_HOME)

alacritty: 
	mkdir -p $(CONFIG_HOME)/alacritty 
	rsync -av --progress $(PWD)/alacritty $(CONFIG_HOME)


clean:
	rm -rf $(CONFIG_HOME)/zsh 
	rm -rf $(CONFIG_HOME)/nvim 
	rm -rf $(HOME)/bin
	rm -rf $(CONFIG_HOME)/i3 
	rm -rf $(CONFIG_HOME)/polybar 
	rm -rf $(CONFIG_HOME)/nvim 
	rm -rf $(CONFIG_HOME)/kitty 
	rm -rf $(CONFIG_HOME)/alacritty 
