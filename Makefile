all: up

up: volumes
	@docker-compose -f src/docker-compose.yml up -d --build

down:
	@docker-compose -f src/docker-compose.yml down --volume

stop:
	@docker-compose -f src/docker-compose.yml stop

start:
	@docker-compose -f src/docker-compose.yml start

prune: down volume-down
	@docker system prune -af

re: prune up

nginx:
	@docker-compose -f src/docker-compose.yml up  -d --build nginx

mariadb:
	@docker-compose -f src/docker-compose.yml up -d --build mariadb

wordpress:
	@docker-compose -f src/docker-compose.yml up -d --build wordpress

volumes:
	#@mkdir -p /Users/urbanojr/Documents/inception-data/wordpress #MacOS
	#@mkdir -p /Users/urbanojr/Documents/inception-data/mariadb #MacOS
	@mkdir -p /home/ubazzane/data/wordpress
	@mkdir -p /home/ubazzane/data/mariadb

volume-down:
	#@docker volume rm wordpress-volume
	#@docker volume rm mariadb-volume
	#@rm -rf /Users/urbanojr/Documents/inception-data/wordpress #MacOS
	#@rm -rf /Users/urbanojr/Documents/inception-data/mariadb #MacOS


PHONY: up down prune re nginx mariadb wordpress volumes volume-down
