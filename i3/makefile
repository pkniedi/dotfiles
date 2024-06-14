DOTFILES:=$(HOME)/dotfiles
EXCLUDE:= --exclude .mypy_cache --exclude .git

sync: makedir
	rsync -av --progress $(PWD) $(DOTFILES) $(EXCLUDE)

makedir:
	mkdir -p $(DOTFILES)

.Phony: sync makedir
