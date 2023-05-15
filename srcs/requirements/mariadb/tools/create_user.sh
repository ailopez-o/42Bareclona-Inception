# userdel mysql
# useradd -u 999 mysql
# chown -R mysql:mysql /var/lib/mysql

# service mysql start
# mysql -u root -e "DROP DATABASE IF EXISTS ${DB_NAME};"
# mysql -u root -e "DROP USER IF EXISTS '${DB_USER}'@'%';"
# mysql -u root -e "CREATE DATABASE ${DB_NAME};"
# mysql -u root -e "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}'"
# mysql -u root -e "GRANT ALL ON ${DB_NAME}.* TO '${DB_USER}'@'%' IDENTIFIED BY '${$DB_PASSWORD}' WITH GRANT OPTION;"
# mysql -u root -e "FLUSH PRIVILEGES;"
# mysqladmin -u root password "${$DB_ROOT_PASSWORD}"
#service mysql stop


userdel mysql
useradd -u 999 mysql
chown -R mysql:mysql /var/lib/mysql

service mysql start
mysql -u root -e "DROP DATABASE IF EXISTS $MYSQL_DATABASE;"
echo $MYSQL_DATABASE $MYSQL_USER $MYSQL_PASSWORD $MYSQL_ROOT_PASSWORD > log.txt
mysql -u root -e "DROP USER IF EXISTS '$MYSQL_USER'@'%';"
mysql -u root -e "CREATE DATABASE $MYSQL_DATABASE;"
mysql -u root -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'"
mysql -u root -e "GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' WITH GRANT OPTION;"
mysql -u root -e "FLUSH PRIVILEGES;"
mysqladmin -u root password "$MYSQL_ROOT_PASSWORD"
# service mysql stop



