# Usar la imagen base de Debian Bullseye
FROM debian:bullseye

# Instalar MariaDB Server
RUN apt-get update && apt-get install -y mariadb-server && apt-get clean

# Copiar el archivo de configuración personalizado de MariaDB
COPY ./conf/server.conf /etc/mysql/mariadb.conf.d/50-server.cnf


# Copiar el script de entrada
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Exponer el puerto 3306
EXPOSE 3306

# Utilizar el script de entrada como punto de inicio
CMD ["/entrypoint.sh"]
