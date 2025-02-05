#!/bin/bash

#--------------mariadb start--------------#
echo "Starting MariaDB service..."
service mariadb start # start mariadb
sleep 5 # wait for mariadb to start
echo "MariaDB service started."

#--------------mariadb config--------------#

# Create database if it doesn't exist
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DB}\`;"

mysql -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

mysql -u root -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON ${MYSQL_DB}.* TO \`${MYSQL_USER}\`@'%';"

mysql -u root -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

#--------------mariadb restart--------------#
echo "Shutting down MariaDB to restart with new config..."
mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

# Wait a bit for MariaDB to shut down properly
sleep 2

echo "Restarting MariaDB with new config..."
# Restart mariadb with new config in the background to keep the container running
mysqld_safe --port=3306 --bind-address=0.0.0.0 --datadir='/var/lib/mysql'

#--------------Keep the container running--------------#
echo "MariaDB should now be running. Keeping container alive..."
