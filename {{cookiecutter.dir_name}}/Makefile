# Extract MAJOR.MINOR python version
PYTHON_VERSION := $(shell cat $(PWD)/.python-version | awk -F \. {'print $$1"."$$2'})
VENV = .venv
VENV_BIN = $(VENV)/bin

$(VENV): requirements.txt
	python$(PYTHON_VERSION) -m venv $(VENV)
	$(VENV_BIN)/pip install --upgrade pip setuptools && \
	$(VENV_BIN)/pip install -r requirements.txt && \
	touch $(VENV)

ansible-provision: $(VENV)
	ANSIBLE_CONFIG=ansible/ansible.cfg $(VENV_BIN)/ansible-playbook -i ansible/hosts.yml ansible/site.yml

vagrant-recreate:
	vagrant destroy -f
	vagrant up
