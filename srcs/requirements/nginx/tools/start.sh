!/bin/bash

# Ejecutar Certbot
#certbot --nginx -d netard.net -d www.netard.net --non-interactive --agree-tos --email aitorlpzaudikana@gmail.com

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=ES/L=Barcelona/O=1337/OU=student/CN=netard.net"

# Iniciar Nginx
nginx -g "daemon off;"
