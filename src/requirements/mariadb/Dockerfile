# Inherit from the official Debian image
FROM debian:bullseye

# Set the port for the container
EXPOSE 3306

# Install MariaDB
RUN apt-get update && apt-get install -y --no-install-recommends --no-install-suggests mariadb-server \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

COPY tools/setup.sh /
RUN chmod +x /setup.sh && ./setup.sh

CMD ["mysqld_safe", "--bind-address=0.0.0.0"]
