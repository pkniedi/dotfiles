DOTFILES:=$(HOME)/dotfiles
CWD=$(HOME)/.config/zsh
EXCLUDE:=--exclude .oh-my-zsh --exclude .mypy_cache --exclude cache

sync: makedir
	rsync -av --progress $(CWD) $(DOTFILES) $(EXCLUDE)
	rsync -av --progress $(HOME)/.warprc $(DOTFILES)/zsh
	rsync -av --progress $(HOME)/.zshenv $(DOTFILES)/zsh

makedir:
	mkdir -p $(DOTFILES)

.Phony: sync makedir
