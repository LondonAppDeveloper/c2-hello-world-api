
env: ## Create virtual environment.
	@python3 -m venv env

install: ## Install Project Dependencies.
	@pip install -r requirements.txt

install-dev: ## Install Project and Development Dependencies.
	@pip install -r requirements.txt
	@pip install -r requirements-dev.txt

.PHONY: env install install-dev
