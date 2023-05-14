FROM debian:buster


RUN apt-get update
RUN apt-get install -y mariadb-server
RUN apt-get install -y vim

COPY ./tools/startup.sh /usr/local/bin/startup.sh
RUN chmod +x /usr/local/bin/startup.sh
EXPOSE 3306

ENTRYPOINT ["mysqld", "--foreground"]
