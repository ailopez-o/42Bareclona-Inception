all:
	sudo docker-compose -f srcs/docker-compose.yml up -d
stop:
	sudo docker-compose -f srcs/docker-compose.yml down
clean:
	sudo docker-compose -f srcs/docker-compose.yml down
	sudo docker rm srcs-nginx
	sudo docker rm srcs-wordpress
	sudo docker rmi srcs-nginx
	sudo docker rmi srcs-wordpress
	sudo docker volume rm wp-data
	sudo docker network rm inception

prune:
	sudo yes | docker system prune -a --volumes

re: clean all