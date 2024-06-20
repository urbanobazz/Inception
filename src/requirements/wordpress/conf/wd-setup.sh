#!/bin/bash
set -e

cd /var/www/html

#Check if wordpress is installed
if ! wp core is-installed --allow-root; then
	echo "Downloading Wordpress..."
	wp core download --allow-root
else
	echo "Wordpress already installed"
fi

#Check if wp-config.php exists
if [! -f wp-config.php]; then
	echo "Creating wp-config.php..."
	wp config create \
	--dbname=${DB_NAME} \
	--dbuser=${DB_USER} \
	--dbpass=${DB_PASSWORD} \
	--dbhost=${WP_DB_HOST} \
	--allow-root
	wp core install \
	--url=${DOMAIN_NAME} \
	--title=${WP_TITLE} \
	--admin_user=${WP_ADMIN} \
	--admin_password=${WP_ADMIN_PASSWORD} \
	--admin_email=${WP_ADMIN_EMAIL} \
	--allow-root
fi

# create user
if ! wp --allow-root --path="/var/www/html" user get ${WP_USER}; then
	echo "Creating user..."
	wp user create \
	${WP_USER} ${WP_USER_EMAIL} --role=editor \
	--user_pass=${WP_USER_PASSWORD} --allow-root
else
	echo "User already exists"
fi

if [ ! -d /run/php ]; then
	mkdir /run/php
fi

exec $@
