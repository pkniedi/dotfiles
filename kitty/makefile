DOTFILES:=$(HOME)/dotfiles
CWD=$(HOME)/.config/kitty
EXCLUDE:= --exclude .mypy_cache --exclude .git

sync: makedir
	rsync -av --progress $(CWD) $(DOTFILES) $(EXCLUDE)

makedir:
	mkdir -p $(DOTFILES)

.Phony: sync makedir
