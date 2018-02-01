DOCKER_HUB_USER = londonappdev

env: ## Create virtual environment.
	@python3 -m venv env

install: ## Install Project Dependencies.
	@pip install -r requirements.txt

install-dev: ## Install Project and Development Dependencies.
	@pip install -r requirements.txt
	@pip install -r requirements-dev.txt

build: ## Build docker container.
	@docker build --tag $(DOCKER_HUB_USER)/c2-hello-world-api:latest --compress .

push: ## Push docker container to ECR.
	@docker push $(DOCKER_HUB_USER)/c2-hello-world-api:latest

.PHONY: env install install-dev build push
