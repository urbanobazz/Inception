FROM debian:bullseye

EXPOSE 9000

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y php php-fpm \
	php-mysql mariadb-client iputils-ping wget curl\
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

COPY /conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# Install the WordPress CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

# RUN chown -R www-data:www-data /var/www/html

COPY conf/wd-setup.sh /usr/local/bin
RUN pwd && chmod +x /usr/local/bin/wd-setup.sh

# /usr/local/bin/wd-setup.sh

ENTRYPOINT ["bash", "/usr/local/bin/wd-setup.sh"]

