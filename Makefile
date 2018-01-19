
env: ## Create virtual environment.
	@python3 -m venv env

install: ## Install Python Dependencies.
	@pip install -r requirements.txt

.PHONY: env install
