DOCKER_HUB_USER = londonappdev

build: ## Build docker container.
	@docker build --tag $(DOCKER_HUB_USER)/c2-hello-world-api:latest --compress .

push: ## Push docker container to ECR.
	@docker push $(DOCKER_HUB_USER)/c2-hello-world-api:latest

.PHONY: build push
