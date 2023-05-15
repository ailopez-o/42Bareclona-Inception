FROM debian:buster

RUN apt-get update && apt-get upgrade -y
RUN	apt-get install -y nginx 
RUN	apt-get install -y vim netcat
#RUN	apt-get install -y systemctl
#RUN apt-get install -y certbot python3-certbot-nginx

COPY ./conf/nginx.conf /etc/nginx/conf.d/my_nginx.conf
#COPY ./conf/certbot.conf /etc/nginx/sites-available/netard.net

RUN mkdir -p /run/nginx

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
#COPY ./conf/start.sh /usr/local/bin/start.sh
#RUN chmod +x /usr/local/bin//start.sh
#ENTRYPOINT ["/usr/local/bin/start.sh"]
