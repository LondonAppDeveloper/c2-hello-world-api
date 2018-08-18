DOCKER_HUB_USER = londonappdev

build: ## Build docker container
	@docker build --tag $(DOCKER_HUB_USER)/c2-hello-world-api:latest --compress .

push: ## Push docker container to docker hub
	@docker push $(DOCKER_HUB_USER)/c2-hello-world-api:latest

start: ## Start the development server
	@docker-compose up

deploy: ## Deploy TF
	@docker run

.PHONY: build push
