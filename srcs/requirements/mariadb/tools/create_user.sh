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
#mysql -u root -e "DROP DATABASE IF EXISTS incepionbbdd;"
# mysql -u root -e "DROP USER IF EXISTS 'nolan'@'%';"
echo $DB_NAME >> /log.txt
#mysql -u root -e "CREATE DATABASE $DB_NAME;"
# mysql -u root -e "CREATE USER 'nolan'@'%' IDENTIFIED BY '123456'"
# mysql -u root -e "GRANT ALL ON incepionbbdd.* TO 'nolan'@'%' IDENTIFIED BY '123456' WITH GRANT OPTION;"
# mysql -u root -e "FLUSH PRIVILEGES;"
# mysqladmin -u root password "123456"
#service mysql stop



