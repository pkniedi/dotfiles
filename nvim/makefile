DOTFILES:=$(HOME)/dotfiles
CWD=$(HOME)/.config/nvim
EXCLUDE:= --exclude .mypy_cache --exclude .git

sync: 
	@mkdir -p $(DOTFILES)
	@rsync -aq $(CWD) $(DOTFILES) $(EXCLUDE)


.Phony: sync
