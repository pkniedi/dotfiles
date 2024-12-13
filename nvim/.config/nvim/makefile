CONFIG=$(HOME)/.config
CWD=$(shell pwd)
EXCLUDE:= --exclude .mypy_cache --exclude .git


sync:
	@echo "Syncing nvim config"
	rsync -a $(EXCLUDE) $(CWD)/* $(CONFIG)/nvim

pull: 
	rsync -a $(EXCLUDE) $(CONFIG)/nvim/* $(CWD)
