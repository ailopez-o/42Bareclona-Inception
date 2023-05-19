FROM debian:buster

# Update and install dependencies
RUN apt-get update && apt-get upgrade -y
# Install a basic web server
RUN apt-get install -y lighttpd
RUN apt-get install -y wget php php7.3-fpm php-cgi libapache2-mod-php7.3

# RUN lighttpd-enable-mod fastcgi
# RUN lighttpd-enable-mod fastcgi-php

# Change working directory
WORKDIR /var/www/html

# Download Adminer
RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php

# Rename the downloaded file to index.php so it's served as the default page
RUN mv adminer-4.8.1.php index.php

COPY ./phpinfo.php /var/www/html/phpinfo.php 

# Start the web server
CMD lighttpd -D -f /etc/lighttpd/lighttpd.conf