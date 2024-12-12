CONFIG_HOME:=$(HOME)/.config
DOTFILES:=$(PWD)
ARCH_BOOTSTRAP:=helpers/bootstrap/archlinux
HELPER_SCRIPTS:=helpers

# -----------------------------------------------
#  Managing dotfiles


link:
	@./$(HELPER_SCRIPTS)/link.sh
	# @gum spin --title "Linking configuration files..." -- ./$(HELPER_SCRIPTS)/link.sh

push:
	gum spin --title "Pushing configuration files..."  -- ./$(HELPER_SCRIPTS)/sync-repo.sh

pull:
	@gum spin --title "Pulling configuration files..."  -- ./$(HELPER_SCRIPTS)/pull-configs.sh


push_confirm:
	@gum confirm "Pushing changes from this git repo?" && gum spin --title "Pushing configuration files..."  -- ./$(HELPER_SCRIPTS)/sync-repo.sh

pull_confirm:
	@gum confirm "Pulling changes from local repos?" && gum spin --title "Pulling configuration files..."  -- ./$(HELPER_SCRIPTS)/pull-configs.sh


# -----------------------------------------------
# Arch (btw) bootstrap

test: install_requirements

arch_install_requirements:
	@sudo ./$(ARCH_BOOTSTRAP)/install-base-requirements.sh

arch_install_packages:
	@sudo ./$(ARCH_BOOTSTRAP)/install-packages.sh


arch_intstall:
	@sudo ./$(ARCH_BOOTSTRAP)/install-base-requirements.sh
	@sudo ./$(ARCH_BOOTSTRAP)/install-packages.sh


install_light: 
	@echo ":: Setting up nvim and zsh..."
	@sudo ./$(ARCH_BOOTSTRAP)/install-base-requirements.sh
	@sudo ./$(ARCH_BOOTSTRAP)/install-zsh.sh
	@sudo ./$(ARCH_BOOTSTRAP)/install-nvim.sh
