#!/bin/bash

# Iniciar MariaDB en segundo plano para configuración inicial
mysqld_safe --skip-networking &
sleep 5

# Establecer la contraseña del usuario root
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

# Permitir que el usuario root se conecte desde cualquier host y establecer la contraseña
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' WITH GRANT OPTION; FLUSH PRIVILEGES;"

# Crear la base de datos especificada en la variable de entorno
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"

# Crear un usuario adicional usando las variables de entorno
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES;"

# Ejecutar cualquier script SQL adicional en /docker-entrypoint-initdb.d/
#for f in /docker-entrypoint-initdb.d/*.sql; do
#    mysql -u root -p"${MYSQL_ROOT_PASSWORD}" "${MYSQL_DATABASE}" < "$f"
#done

# Detener la instancia de mysqld que se inició en segundo plano
mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown

# Iniciar MariaDB en primer plano
exec mysqld
