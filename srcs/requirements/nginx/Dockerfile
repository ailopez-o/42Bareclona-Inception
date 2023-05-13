FROM debian:bullseye-slim

#RUN apk update && apk upgrade && apk add --no-cache openssl nginx
#RUN apk update && apk upgrade && apk add --no-cache openssl nginx

RUN 	apt-get update && apt-get upgrade -y
RUN		apt-get install -y nginx 
RUN		apt-get install -y vim 

COPY ./conf/nginx.conf /etc/nginx/conf.d/my_nginx.conf

RUN mkdir -p /run/nginx


#COPY ./conf/nginx.conf /etc/nginx/http.d/my_nginx.conf
#copy ./conf/default.conf /custom/default.conf
#copy ./tools/script.sh /custom/script.sh

#cmd sh /custom/script.sh