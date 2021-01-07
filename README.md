# Purpose

Configure your retropie.

# Configuration

* Configure `inventory/group_vars/all.yml` vars like `nfs_server` and `nfs_base_path`.

* Add your ssh keys to `roles/raspbian/tasks/ssh.yml`.

## Ansible vault

Put your vault password in the file `.vault_pass` (it's in the `.gitignore`). The default password is `foobar`.

Now configure your password

# Makefile

Make sure to configure your ssh keys for the Raspis, otherwise you won't be able to login afterwards (SSH password logins are disabled afterwards).

The ansible playbooks are controlled with a simple `Makefile`. See the help target for more details.

Execute `make help`.
