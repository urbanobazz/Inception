all: up

up:
	@docker-compose -f src/docker-compose.yml up -d

down:
	@docker-compose -f src/docker-compose.yml down

prune:
	@docker system prune -af

re: down prune up

nginx:
	@docker-compose -f src/docker-compose.yml up my_nginx -d

mariadb:
	@docker-compose -f src/docker-compose.yml up my_mariadb -d --build

wordpress:
	@docker-compose -f src/docker-compose.yml up my_wordpress -d

PHONY: up down prune re nginx mariadb wordpress
