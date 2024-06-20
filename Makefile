all: up

up:
	@docker-compose -f src/docker-compose.yml up -d --build

down:
	@docker-compose -f src/docker-compose.yml down

prune:
	@docker system prune -af

re: down prune up

nginx:
	@docker-compose -f src/docker-compose.yml up nginx -d --build

mariadb:
	@docker-compose -f src/docker-compose.yml up mariadb -d --build

wordpress:
	@docker-compose -f src/docker-compose.yml up wordpress -d --build

PHONY: up down prune re nginx mariadb wordpress
