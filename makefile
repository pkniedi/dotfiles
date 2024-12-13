CONFIG_HOME:=$(HOME)/.config
DOTFILES:=$(PWD)
ARCH_BOOTSTRAP:=helpers/bootstrap/archlinux
HELPER_SCRIPTS:=helpers


# -----------------------------------------------
#  Managing dotfiles


link:
	@echo "Use stow intead"
	# @./$(HELPER_SCRIPTS)/link.sh

# -----------------------------------------------
# Arch (btw) bootstrap


arch_intstall: 
	@sudo ./$(ARCH_BOOTSTRAP)/install-base-requirements.sh
	@sudo ./$(ARCH_BOOTSTRAP)/install-packages.sh


arch_install_light: 
	@echo ":: Setting up nvim and zsh..."
	@sudo ./$(ARCH_BOOTSTRAP)/install-base-requirements.sh
	@sudo ./$(ARCH_BOOTSTRAP)/install-zsh.sh
	@sudo ./$(ARCH_BOOTSTRAP)/install-nvim.sh
