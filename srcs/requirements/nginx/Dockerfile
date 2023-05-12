FROM alpine:3.17

RUN apk update && apk upgrade && apk add --no-cache openssl nginx
#RUN apk update && apk upgrade && apk add --no-cache openssl nginx

RUN mkdir -p /var/www/html && chmod 755 /var/www/html
#RUN chown -R www-data:www-data /var/www/html

#copy ./conf/nginx.conf /etc/nginx/nginx.conf
#copy ./conf/default.conf /custom/default.conf
#copy ./tools/script.sh /custom/script.sh

#cmd sh /custom/script.sh