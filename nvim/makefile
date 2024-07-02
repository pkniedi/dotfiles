DOTFILES:=$(HOME)/dotfiles
CWD=$(HOME)/.config/nvim
EXCLUDE:= --exclude .mypy_cache --exclude .git

sync: makedir
	rsync -av --progress $(CWD) $(DOTFILES) $(EXCLUDE)

makedir:
	mkdir -p $(DOTFILES)

.Phony: sync makedir
