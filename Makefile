all:
	docker-compose -f srcs/docker-compose.yml up -d
stop:
	docker-compose -f srcs/docker-compose.yml down

cwp:
	-docker-compose -f srcs/docker-compose.yml down
	-docker rm wordpress
	-docker rmi srcs-wordpress
	-docker volume rm wp-data

cmdb:
	-docker-compose -f srcs/docker-compose.yml down
	-docker rm mariadb
	-docker rmi srcs-mariadb
	-docker volume rm sql-data

cnginx:
	-docker-compose -f srcs/docker-compose.yml down
	-docker rm nginx
	-docker rmi srcs-nginx

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