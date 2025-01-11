# Install

First install requirements

```bash
ansible-galaxy install -r requirements.yml

```

Then run the playbook
```bash
ansible-playbook playbook.yml -i inventory.yml --vault-password-file=$HOME/.vault_pass
```
