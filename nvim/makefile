DOTFILES:=$(HOME)/dotfiles
CWD=$(HOME)/.config/nvim
EXCLUDE:= --exclude .mypy_cache --exclude .git

sync: makedir
	@rsync -aq $(CWD) $(DOTFILES) $(EXCLUDE)

makedir:
	mkdir -p $(DOTFILES)

.Phony: sync makedir
