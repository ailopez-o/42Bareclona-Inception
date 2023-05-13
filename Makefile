SUDO = 

all:
	sudo docker-compose -f srcs/docker-compose.yml up -d
stop:
	sudo docker-compose -f srcs/docker-compose.yml down
clean:
	-${SUDO} docker-compose -f srcs/docker-compose.yml down
	-${SUDO} docker rm srcs-nginx
	-${SUDO} docker rm srcs-wordpress
	-${SUDO} docker rmi srcs-nginx
	-${SUDO} docker rmi srcs-wordpress
	-${SUDO} docker volume rm wp-data
	-${SUDO} docker network rm inception

prune:
	${SUDO} yes | docker system prune -a --volumes

re: clean all