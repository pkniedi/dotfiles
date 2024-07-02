DOTFILES:=$(HOME)/dotfiles
CWD=$(HOME)/.config/alacritty
EXCLUDE:= --exclude .mypy_cache --exclude .git

sync: makedir
	@rsync -aq $(CWD) $(DOTFILES) $(EXCLUDE)

makedir:
	mkdir -p $(DOTFILES)

.Phony: sync makedir
