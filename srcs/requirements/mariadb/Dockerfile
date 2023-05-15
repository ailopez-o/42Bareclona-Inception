FROM debian:buster

#INSTALL SERVICES
RUN apt-get update
RUN apt-get install -y mariadb-server
RUN apt-get install -y vim procps netcat

#SERVER CONF
RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./conf/server.conf /etc/mysql/mariadb.conf.d/50-server.cnf

#CREATE DATABASE & USER
ARG MYSQL_DATABASE
COPY ./tools/create_user.sh /usr/local/bin/create_user.sh
RUN chmod +x /usr/local/bin/create_user.sh
RUN /usr/local/bin/create_user.sh

#PORT
EXPOSE 3306

#START
CMD ["mysqld_safe"]

