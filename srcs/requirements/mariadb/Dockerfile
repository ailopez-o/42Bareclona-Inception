FROM debian:buster

#INSTALL SERVICES
RUN apt-get update
RUN apt-get install -y mariadb-server
RUN apt-get install -y vim procps netcat

#SERVER CONF
RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./conf/server.conf /etc/mysql/mariadb.conf.d/50-server.cnf

ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT_PASSWORD

ENV MYSQL_DATABASE=$MYSQL_DATABASE
ENV MYSQL_USER=$MYSQL_USER
ENV MYSQL_PASSWORD=$MYSQL_PASSWORD
ENV MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD

#CREATE DATABASE & USER
COPY ./tools/create_user.sh /usr/local/bin/create_user.sh
RUN chmod +x /usr/local/bin/create_user.sh
RUN /usr/local/bin/create_user.sh

#STARTUP SECUENCE
# COPY ./tools/startup.sh /usr/local/bin/startup.sh
# RUN chmod +x /usr/local/bin/startup.sh
# RUN /usr/local/bin/startup.sh

#PORT
EXPOSE 3306

#START
CMD ["mysqld_safe"]
#ENTRYPOINT ["/usr/local/bin/startup.sh"]

# test if you can connect to maridb database
# sudo docker exec -it mariadb mariadb --user tblaase -proot
# SHOW DATABASES;
# USE wordpress;
# SHOW TABLES
