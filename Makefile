EXAMPLE = example

build:  ## Create example from cookiecutter template
	cookiecutter --overwrite-if-exists --no-input --config-file ./sample_config .

clean:
	rm -rf example/

test:
	$(MAKE) build
	cd example && \
		$(MAKE) vagrant-recreate ansible-provision && \
		vagrant destroy -f
