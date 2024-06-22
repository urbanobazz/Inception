#!/bin/bash

#service mysql start
#sleep 5
# Create the SQL init script
#mysql -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"
#mysql -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"
#mysql -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"
#mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"
#mysql -e "FLUSH PRIVILEGES;"

#service mysql stop
# Start the database with the command passed to the script
#exec $@

set -e

echo "Starting MariaDB..."
service mariadb start

echo "Creating database..."
mariadb -v -u root << EOF
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO 'root'@'%' IDENTIFIED BY '$DB_ROOT_PASSWORD';
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$DB_ROOT_PASSWORD');
EOF

sleep 5

echo "Stopping MariaDB..."
service mariadb stop

echo "Starting MariaDB again..."
exec $@
