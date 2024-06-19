# Inherit from the official Debian image
FROM debian:bullseye

# Set the port for the container
EXPOSE 3306

# Install MariaDB
RUN apt-get update && apt-get install -y --no-install-recommends --no-install-suggests mariadb-server \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY	tools/setup.sh /bin/
RUN		chmod +x /bin/setup.sh

CMD		["setup.sh", "mysqld_safe"]
