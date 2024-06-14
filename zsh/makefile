DOTFILES:=$(HOME)/dotfiles

sync: makedir
	rsync -av --progress $(PWD) $(DOTFILES) --exclude .oh-my-zsh --exclude .mypy_cache

makedir:
	mkdir -p $(DOTFILES)

.Phony: sync makedir
