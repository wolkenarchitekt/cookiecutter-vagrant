EXAMPLE = example

build:  ## Create example from cookiecutter template
	cookiecutter --overwrite-if-exists --no-input --config-file ./sample_config .

clean:
	rm -rf example/