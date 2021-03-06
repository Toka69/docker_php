container ?= php-fpm
shell ?= zsh
DOCKER_COMPOSE_FILES = -f docker-compose.yml

# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

# DOCKER TASKS
# Build or rebuild services
build: ## Build or rebuild services
	docker-compose $(DOCKER_COMPOSE_FILES) build

# Start services with log follow
start: ## Start services with log follow
	docker-compose $(DOCKER_COMPOSE_FILES) up

# Start services in background
up: ## Start services in background
	docker-compose $(DOCKER_COMPOSE_FILES) up -d

# Stop services
stop: ## Stop services
	docker-compose $(DOCKER_COMPOSE_FILES) stop

# Stop and remove containers, networks, images, and volumes
down: ## Stop and remove containers, networks, images, and volumes
	docker-compose $(DOCKER_COMPOSE_FILES) down

# Validate and view the Compose file
config: ## Validate and view the Compose file
	docker-compose $(DOCKER_COMPOSE_FILES) config

# Connect into container
sh: ## Connect into container - Specify container (php-fpm [default]/nginx) - Specify shell (zsh [default]/bash/sh)
	docker exec -it -u 1000 $(container) $(shell)

# Connect into blackfire container
shbf: ## Connect into blackfire container
	docker exec -it -u 1000 blackfire sh

# Execute blackfire curl
blackfire_curl: ## Execute blackfire curl
	docker exec -it blackfire blackfire curl $(word 2, $(MAKECMDGOALS))

# Execute blackfire run
blackfire_run: ## Execute blackfire run
	docker exec -it blackfire blackfire run $(word 2, $(MAKECMDGOALS))
