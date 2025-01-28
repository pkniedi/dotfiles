#  Use gum confirm to prevent accidental execution
default:
	@gum confirm "Symlinking configuration files?" --no-show-help && ansible-playbook -t symlink  -i inventory.yml playbook.yml || gum log --structured --level error "Aborted symlinking configuration files"

symlink:
	@ansible-playbook -t symlink  -i inventory.yml playbook.yml -t symlink

symlink:
	@ansible-playbook -t symlink  -i inventory.yml playbook.yml -t gui

dev:
	@ansible-playbook -t symlink  -i inventory.yml playbook.yml -t dev


#  TODO: --vault-password-file=$HOME/.vault_pass

# ------------------------------------------------------------------------------
# Initial setup
# This is the only target that should only require ansible-core to be installed

install: 
	@ansible-galaxy install -r requirements.yml
	@ansible-playbook -i inventory.yml playbook.yml
