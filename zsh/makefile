DOTFILES:=$(HOME)/dotfiles
EXCLUDE:=--exclude .oh-my-zsh --exclude .mypy_cache --exclude .zcompdump

sync: makedir
	rsync -av --progress $(PWD) $(DOTFILES)  $(EXCLUDE)

makedir:
	mkdir -p $(DOTFILES)

.Phony: sync makedir
