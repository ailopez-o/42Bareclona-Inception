FROM debian:buster

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y wget php7.3 php-fpm php-mysql mariadb-client
RUN apt-get install -y vim 

RUN wget https://wordpress.org/wordpress-6.2.tar.gz -P /var/www/html && cd /var/www/html \
	&& tar -xzf wordpress-6.2.tar.gz && rm wordpress-6.2.tar.gz

COPY ./index.html /var/www/html/
COPY ./phpinfo.php /var/www/html/

COPY ./conf/php.conf /etc/php/7.3/fpm/pool.d/www.conf
#copy ./conf/conf.php /custom/conf.php

#RUN chown -R root:root /var/www/wordpress
#RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

#copy tools/. /custom/.
RUN mkdir -p /run/php
RUN chmod 755 /run/php
ENTRYPOINT ["/usr/sbin/php-fpm7.3", "-F"]
#CMD ["tail", "-f", "/dev/null"]
