# Usamos como base Debian Booster
FROM debian:buster

# Actualizamos el sistema e instalamos los paquetes necesarios
RUN apt-get update && apt-get upgrade -y

# Instalamos los paquetes necesarios para PHP y Apache
RUN apt-get install -y apache2 php7.3 php7.3-fpm libapache2-mod-php7.3

# Habilitamos los módulos necesarios de Apache
RUN a2enmod proxy_fcgi setenvif
RUN a2enconf php7.3-fpm

# Copiamos el directorio de nuestro proyecto al directorio predeterminado de Apache
COPY ./phpinfo.php /var/www/html/phpinfo.php

# Iniciamos el servicio de Apache al arrancar el contenedor
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
