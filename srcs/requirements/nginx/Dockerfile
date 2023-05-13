FROM debian:bullseye-slim

#RUN apk update && apk upgrade && apk add --no-cache openssl nginx
#RUN apk update && apk upgrade && apk add --no-cache openssl nginx

RUN apt-get update && apt-get upgrade -y
RUN	apt-get install -y nginx 
RUN	apt-get install -y vim
RUN	apt-get install -y systemctl
RUN apt-get install -y certbot python3-certbot-nginx

COPY ./conf/nginx.conf /etc/nginx/conf.d/my_nginx.conf
COPY ./conf/certbot.conf /etc/nginx/sites-available/netard.net

RUN mkdir -p /run/nginx


# ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
ENTRYPOINT ["/conf/start.sh"]
RUN certbot --nginx -d netard.net -d www.netard.net --non-interactive --agree-tos --email aitorlpzaudikana@gmail.com

#COPY ./conf/nginx.conf /etc/nginx/http.d/my_nginx.conf
#copy ./conf/default.conf /custom/default.conf
#copy ./tools/script.sh /custom/script.sh

#cmd sh /custom/script.sh