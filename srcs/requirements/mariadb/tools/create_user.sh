#!/bin/bash

service mysql start

mysql -u mysql -e "CREATE DATABASE ${DB_NAME};"
echo "CREATE DATABASE ${DB_NAME};"
mysql -u mysql -e "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"
echo "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"
mysql -u mysql -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';"
echo "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';"
mysql -u mysql -e "FLUSH PRIVILEGES;"
mysql -u mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"
echo "ALTER USER 'mysql'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"