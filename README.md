# Install


First install all ansible and all other dependencies
```bash
yay -S python3 ansible-core git # On Arch
brew install ansible git        # On MacOS
```

Before running the playbook, install the required roles with:
```bash
ansible-galaxy install -r requirements.yml

```

Run the preferred playbook 
```bash
ansible-playbook full-setup.yml -i inventory.yml  # For full install
```
or
```bash
ansible-playbook light-setup.yml -i inventory.yml       # For minimal install (e.g. on pi)
```
<!-- # TODO: --vault-password-file=$HOME/.vault_pass -->

# Roles

privileged: do some privileged tasks that require to become root


# TODO:

- [ ] setup sddm

setup fonts correctly:
cp -r /usr/share/fonts ~/.local/share/  ??
setup sddm.conf file
there is a script in dotfiles repo where I yoinked the setup
