FROM debian:buster

# Update and install dependencies
RUN apt-get update && apt-get install -y \
    php8.0 \
    php-mysql \
    wget
    
# Install a basic web server
RUN apt-get install -y lighttpd

# Change working directory
WORKDIR /var/www/html

# Download Adminer
RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php

# Rename the downloaded file to index.php so it's served as the default page
RUN mv adminer-4.8.1.php index.php

# Start the web server
CMD lighttpd -D -f /etc/lighttpd/lighttpd.conf