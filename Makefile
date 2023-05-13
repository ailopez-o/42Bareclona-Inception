all:
	docker-compose -f srcs/docker-compose.yml up -d
stop:
	docker-compose -f srcs/docker-compose.yml down
clean:
	-docker-compose -f srcs/docker-compose.yml down
	-docker rm srcs-nginx
	-docker rm srcs-wordpress
	-ocker rmi srcs-nginx
	-docker rmi srcs-wordpress
	-docker volume rm wp-data
	-docker network rm inception

prune:
	yes | docker system prune -a --volumes

re: clean all