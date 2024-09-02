FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y
RUN	apt-get install -y nginx 
RUN	apt-get install -y vim netcat
RUN	apt-get install -y openssl
#RUN	apt-get install -y systemctl
#RUN apt-get install -y certbot python3-certbot-nginx

COPY ./conf/nginx.conf /etc/nginx/conf.d/my_nginx.conf
#COPY ./conf/certbot.conf /etc/nginx/sites-available/netard.net

#RUN mkdir /myimage

#RUN mkdir -p /run/nginx
#RUN certbot --nginx -d netard.net -d www.netard.net --non-interactive --agree-tos --email aitorlpzaudikana@gmail.com

RUN 	openssl req \             
	-x509 \             
	-nodes \             
	-days 365 \             
	-newkey rsa:2048 \             
	-keyout /etc/ssl/private/nginx-selfsigned.key \             
	-out /etc/ssl/certs/nginx-selfsigned.crt \             
	-subj '/C=ES/ST=Barcelona/L=Barcelona/OU=42Barcelona/CN=netard.net'

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
