#!/bin/bash

# Must be deleted and put in the docker secrets later
DB_NAME=mydb
DB_USER=justme
DB_PASSWORD=sthdifficult

service mysql start
# Create the SQL init script
mysql -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"
mysql -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"

sleep 5
service mysql stop

# Start the database with the command passed to the script
exec $@
