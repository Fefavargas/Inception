..# Variables
PROJECT_NAME := wordpress_project
COMPOSE_FILE := docker-compose.yml

# Default target
.PHONY: help
help:
	@echo ""
	@echo "Available commands:"
	@echo "  make up         - Start containers in detached mode"
	@echo "  make down       - Stop and remove containers"
	@echo "  make restart    - Restart all containers"
	@echo "  make logs       - Follow logs from all containers"
	@echo "  make ps         - Show running containers"
	@echo "  make clean      - Remove containers, volumes, and networks"
	@echo "  make rebuild    - Rebuild containers without cache"
	@echo ""

.PHONY: up
up:
	docker compose -p $(PROJECT_NAME) -f $(COMPOSE_FILE) up -d

.PHONY: down
down:
	docker compose -p $(PROJECT_NAME) -f $(COMPOSE_FILE) down

.PHONY: restart
restart: down up

.PHONY: logs
logs:
	docker compose -p $(PROJECT_NAME) -f $(COMPOSE_FILE) logs -f

.PHONY: ps
ps:
	docker compose -p $(PROJECT_NAME) -f $(COMPOSE_FILE) ps

.PHONY: clean
clean:
	docker compose -p $(PROJECT_NAME) -f $(COMPOSE_FILE) down -v --remove-orphans

.PHONY: rebuild
rebuild:
	docker compose -p $(PROJECT_NAME) -f $(COMPOSE_FILE) build --no-cache
	docker compose -p $(PROJECT_NAME) -f $(COMPOSE_FILE) up -d