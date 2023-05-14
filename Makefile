all:
	docker-compose -f srcs/docker-compose.yml up -d
stop:
	docker-compose -f srcs/docker-compose.yml down
clean:
	-docker-compose -f srcs/docker-compose.yml down
	-docker rm nginx
	-docker rm wordpress
	-docker rm mariadb	
	-docker rmi srcs-mariadb
	-docker rmi srcs-nginx
	-docker rmi srcs-wordpress
	-docker volume rm wp-data
	-docker volume rm sql-data
	-docker network rm inception

prune:
	yes | docker system prune -a --volumes

re: clean all