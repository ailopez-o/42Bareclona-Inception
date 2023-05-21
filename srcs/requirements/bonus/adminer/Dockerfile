# Usamos como base Debian Booster
FROM debian:buster

# Actualizamos el sistema e instalamos los paquetes necesarios
RUN apt-get update && apt-get upgrade -y

# Instalamos los paquetes necesarios para PHP y Apache
RUN apt-get install -y wget vim apache2 php7.3 php7.3-fpm php7.3-mysqli ibapache2-mod-php7.3

# Habilitamos los módulos necesarios de Apache
RUN a2enmod proxy_fcgi setenvif
RUN a2enconf php7.3-fpm

WORKDIR /var/www/html/
# Download Adminer
RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php
# Rename the downloaded file to index.php so it's served as the default page
RUN mv adminer-4.8.1.php index.php
RUN rm index.html
# Copiamos el directorio de nuestro proyecto al directorio predeterminado de Apache
COPY ./phpinfo.php /var/www/html/phpinfo.php

EXPOSE 80
# Iniciamos el servicio de Apache al arrancar el contenedor
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
