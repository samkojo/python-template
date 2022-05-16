.PHONY: install
install:
	@poetry install

.PHONY: format
format:
	@blue .
	@isort .

.PHONY: lint
lint:
	@blue --check .
	@isort --check .
	@prospector

.PHONY: test
test:
	@pytest . -v

.PHONY: check
check:
	@safety check
