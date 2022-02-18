# Extract MAJOR.MINOR python version
PYTHON_VERSION := $(shell cat $(PWD)/.python-version | awk -F \. {'print $$1"."$$2'})
VENV = .venv
VENV_BIN = $(VENV)/bin

$(VENV):
	python$(PYTHON_VERSION) -m venv $(VENV)
	$(VENV_BIN)/pip install --upgrade pip setuptools && \
		$(VENV_BIN)/pip install ansible && \
		touch $(VENV)

ansible-provision: $(VENV)
	ANSIBLE_CONFIG=ansible/ansible.cfg $(VENV_BIN)/ansible-playbook -i ansible/hosts.yml ansible/site.yml

vagrant-recreate:
	vagrant destroy -f
	sleep 5
	vagrant up
