FROM debian:buster

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y wget php php7.3-fpm php7.3-mysqli
RUN apt-get install -y vim netcat

#JUST TESTING
COPY ./index.html /var/www/html/
COPY ./phpinfo.php /var/www/html/

#ENV VALUES
ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT_PASSWORD

ENV MYSQL_DATABASE=$MYSQL_DATABASE
ENV MYSQL_USER=$MYSQL_USER
ENV MYSQL_PASSWORD=$MYSQL_PASSWORD
ENV MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD


#PHP SETUP
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# RUN wget https://wordpress.org/wordpress-6.2.tar.gz -P /var/www/html && cd /var/www/html \
# 	&& tar -xzf wordpress-6.2.tar.gz && rm wordpress-6.2.tar.gz
#RUN chown -R root:root /var/www/html/wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

#WP SETUP
# COPY ./tools/wp_setup.sh /usr/local/bin/wp_setup.sh
# RUN chmod +x /usr/local/bin/wp_setup.sh
# RUN /usr/local/bin/wp_setup.sh

EXPOSE 9000
WORKDIR /var/www/html/

#copy tools/. /custom/.
RUN mkdir -p /run/php
RUN chmod 755 /run/php
ENTRYPOINT ["/usr/sbin/php-fpm7.3", "-F"]
#CMD ["tail", "-f", "/dev/null"]

