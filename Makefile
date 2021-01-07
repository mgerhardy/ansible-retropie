ANSIBLE := ./ansiblew.sh ansible-playbook
ANSIBLE_VAULT := --vault-password-file=./.vault_pass
ANSIBLE_OPTIONS := -i inventory/hosts.ini $(ANSIBLE_VAULT) -e @secrets/vault.yml
Q ?= @

ifeq ($(Q),)
  ANSIBLE_OPTIONS += -v
endif

define exec
	$(ANSIBLE) $(1).yml $(ANSIBLE_OPTIONS)
endef

help:
	@echo "Targets:"
	@echo "  all         - install and configure"
	@echo "                this basically just combines 'setup' followed by 'configure'"
	@echo "  setup       - configure raspbian"
	@echo "  configure   - configure retropie (this also includes the initial scrape)"
	@echo "  scrape      - only scrape the roms - configure must have been executed before"

all: setup configure

setup:
	$(call exec,$@)

scrape:
	$(call exec,$@)

config configure:
	$(call exec,configure)

vault:
	$(Q)./ansiblew.sh ansible-vault edit $(ANSIBLE_VAULT) secrets/vault.yml
