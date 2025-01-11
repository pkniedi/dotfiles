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
ansible-playbook full-install.yml -i inventory.yml  # For full install
```
or
```bash
ansible-playbook install.yml -i inventory.yml       # For minimal install
```
<!-- # TODO: --vault-password-file=$HOME/.vault_pass -->
