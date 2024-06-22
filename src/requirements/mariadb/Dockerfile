# Inherit from the official Debian image
FROM debian:bullseye

ARG DB_NAME
ARG DB_USER
ARG DB_PASSWORD
ARG DB_ROOT_PASSWORD

ENV DB_NAME=$DB_NAME
ENV DB_USER=$DB_USER
ENV DB_PASSWORD=$DB_PASSWORD
ENV DB_ROOT_PASSWORD=$DB_ROOT_PASSWORD

# Set the port for the container
EXPOSE 3306

# Install MariaDB
RUN apt-get update && apt-get install -y --no-install-recommends --no-install-suggests mariadb-server iputils-ping \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY	tools/setup.sh /bin/
RUN		chmod +x /bin/setup.sh && /bin/setup.sh

CMD ["mysqld_safe"]

#CMD	["bash", "-c", "tail -f /dev/null"]
