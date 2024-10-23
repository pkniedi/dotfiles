CONFIG_HOME:=$(HOME)/.config
DOTFILES:=$(PWD)/dotfiles

.PHONY: sync md cp-dirs clean zsh nvim bin i3 polybar nvim kitty alacritty

sync: zsh nvim bin i3 polybar nvim kitty alacritty


test:
	echo $$(date) from test function

pull:
	@echo "Pulling all updates from configuration files..."
	@make --file=$(CONFIG_HOME)/nvim/makefile sync
	@make --file=$(CONFIG_HOME)/zsh/makefile sync
	@make --file=$(CONFIG_HOME)/i3/makefile sync
	@make --file=$(CONFIG_HOME)/alacritty/makefile sync
	@make --file=$(CONFIG_HOME)/kitty/makefile sync
	@make --file=$(CONFIG_HOME)/polybar/makefile sync
	@make --file=$(CONFIG_HOME)/picom/makefile sync
	@make --file=$(HOME)/bin/makefile sync

# FIX: does not load properly
zsh:
	@echo "Copying zsh configuration files..."
	@mkdir -p $(CONFIG_HOME)/zsh
	@rsync -av --progress --recursive $(DOTFILES)/zsh $(CONFIG_HOME)
	@rsync -av --progress $(DOTFILES)/zsh/zshenv $(HOME)/.zshenv
	@rsync -av --progress $(DOTFILES)/zsh/.warprc $(HOME)

bin:
	@echo "Copying scripts..."
	@mkdir -p $(HOME)/bin
	@rsync -av --recursive --progress $(DOTFILES)/bin $(HOME)

i3:
	@echo "Copying i3 configuration files..."
	@mkdir -p $(CONFIG_HOME)/i3
	@rsync -av --recursive --progress $(DOTFILES)/i3 $(CONFIG_HOME)


polybar:
	@echo "Copying polybar configuration files..."
	@mkdir -p $(CONFIG_HOME)/polybar
	@rsync -av ---recursive -progress $(DOTFILES)/polybar $(CONFIG_HOME)


nvim:
	@echo "Copying nvim configuration files..."
	@mkdir -p $(CONFIG_HOME)/nvim
	@rsync -av --recursive --progress $(DOTFILES)/nvim $(CONFIG_HOME)

kitty:
	@echo "Copying configuration files..."
	@mkdir -p $(CONFIG_HOME)/kitty
	@rsync -av --recursive --progress $(DOTFILES)/kitty $(CONFIG_HOME)

alacritty:
	@echo "Copying configuration files..."
	@mkdir -p $(CONFIG_HOME)/alacritty
	@rsync -av--recursive --progress $(DOTFILES)/alacritty $(CONFIG_HOME)

# TODO:

# bash:
# 	@echo "Copying bash configuration files..."
# 	@mkdir -p $(CONFIG_HOME)/zsh
# 	@rsync -av --progress --recursive $(PWD)/zsh $(CONFIG_HOME)
# 	@rsync -av --progress $(PWD)/zsh/zshenv $(HOME)/.zshenv
	# @rsync -av --progress $(PWD)/zsh/.warprc $(HOME)



clean:
	@echo "Deleting everything..."
	@rm -rf $(CONFIG_HOME)/zsh
	@rm -rf $(CONFIG_HOME)/nvim
	@rm -rf $(HOME)/bin
	@rm -rf $(CONFIG_HOME)/i3
	@rm -rf $(CONFIG_HOME)/polybar
	@rm -rf $(CONFIG_HOME)/nvim
	@rm -rf $(CONFIG_HOME)/kitty
	@rm -rf $(CONFIG_HOME)/alacritty
