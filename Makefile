all: up

up: volumes
	@docker-compose -f src/docker-compose.yml up -d --build

down:
	@docker-compose -f src/docker-compose.yml down

prune: down volume-down
	@docker system prune -af

re: prune up

nginx:
	@docker-compose -f src/docker-compose.yml up nginx -d --build

mariadb:
	@docker-compose -f src/docker-compose.yml up mariadb -d --build

wordpress:
	@docker-compose -f src/docker-compose.yml up wordpress -d --build

volumes:
	@mkdir -p /Users/urbanojr/Documents/inception-data/wordpress
	@mkdir -p /Users/urbanojr/Documents/inception-data/mariadb

volume-down:
	@rm -rf /Users/urbanojr/Documents/inception-data/wordpress
	@rm -rf /Users/urbanojr/Documents/inception-data/mariadb

PHONY: up down prune re nginx mariadb wordpress volumes volume-down
