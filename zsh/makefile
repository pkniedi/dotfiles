DOTFILES:=$(HOME)/dotfiles
CWD=$(HOME)/.config/zsh
EXCLUDE:=--exclude .mypy_cache --exclude cache

sync: makedir
	rsync --recursive $(CWD) $(DOTFILES) $(EXCLUDE)
	rsync $(HOME)/.warprc $(DOTFILES)/zsh

makedir:
	@mkdir -p $(DOTFILES)

.Phony: sync makedir
