FROM debian:buster

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y wget php php7.3-fpm php7.3-mysqli mariadb-client
RUN apt-get install -y vim netcat

#JUST TESTING
# COPY ./index.html /var/www/html/
COPY ./phpinfo.php /var/www/html/

#PHP SETUP
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN wget https://wordpress.org/wordpress-6.2.tar.gz -P /var/www/html && cd /var/www/html \
	&& tar -xzf wordpress-6.2.tar.gz && rm wordpress-6.2.tar.gz
RUN chown -R root:root /var/www/html/wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

#WP SETUP
ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_HOST
ARG DOMAIN_NAME
ARG WP_TITLE
ARG WP_ADMIN_USR
ARG WP_ADMIN_PWD
ARG WP_ADMIN_EMAIL
ARG WP_USR
ARG WP_EMAIL
ARG WP_PWD
COPY ./tools/wp_setup.sh /usr/local/bin/wp_setup.sh
RUN chmod +x /usr/local/bin/wp_setup.sh
#RUN /usr/local/bin/wp_setup.sh

EXPOSE 9000
WORKDIR /var/www/html/

#copy tools/. /custom/.
RUN mkdir -p /run/php
RUN chmod 755 /run/php
CMD ["/usr/sbin/php-fpm7.3", "-F"]
#CMD ["tail", "-f", "/dev/null"]

