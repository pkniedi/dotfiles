DOTFILES:=$(HOME)/dotfiles
CWD=$(HOME)/.config/picom
EXCLUDE:= --exclude .mypy_cache --exclude .git

sync: makedir
	@rsync -aq -recursive $(CWD) $(DOTFILES) $(EXCLUDE)

makedir:
	mkdir -p $(DOTFILES)

.Phony: sync makedir
