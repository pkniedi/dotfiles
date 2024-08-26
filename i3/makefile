DOTFILES:=$(HOME)/dotfiles
CWD=$(HOME)/.config/i3
EXCLUDE:= --exclude .mypy_cache --exclude .git

sync: makedir
	rsync -av --progress --recursive $(CWD) $(DOTFILES) $(EXCLUDE)

makedir:
	mkdir -p $(DOTFILES)

.Phony: sync makedir
