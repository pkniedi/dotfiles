CONFIG_HOME:=$(HOME)/.config

.PHONY: sync md cp-dirs clean

sync: md cp-dirs

md:
	@echo "Creating directories..."
	mkdir -p $(CONFIG_HOME)/zsh 
	mkdir -p $(CONFIG_HOME)/nvim 
	mkdir -p $(CONFIG_HOME)/bin
	mkdir -p $(CONFIG_HOME)/i3 
	mkdir -p $(CONFIG_HOME)/polybar 
	mkdir -p $(CONFIG_HOME)/nvim 
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
	rsync -av --progress $(PWD)/kitty $(CONFIG_HOME)


clean:
	mkdir -p $(CONFIG_HOME)/zsh 
	mkdir -p $(CONFIG_HOME)/nvim 
	mkdir -p $(CONFIG_HOME)/bin
	mkdir -p $(CONFIG_HOME)/i3 
	mkdir -p $(CONFIG_HOME)/polybar 
	mkdir -p $(CONFIG_HOME)/nvim 
	mkdir -p $(CONFIG_HOME)/kitty 
	mkdir -p $(CONFIG_HOME)/alacritty 
