################################################################################
# Colort
################################################################################

DEL_LINE =		\033[2K
ITALIC =		\033[3m
DEF_COLOR =		\033[0;39m
GRAY =			\033[0;90m
RED =			\033[0;91m
DARK_YELLOW =	\033[38;5;143m
BROWN =			\033[38;2;184;143;29m
DARK_GRAY =		\033[38;5;234m
DARK_GREEN =	\033[1m\033[38;2;75;179;82m

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
	@echo "$(DARK_GREEN)NGNIX Docker & Image Cleaned ✅$(DEF_COLOR)"
	-docker rm nginx
	-docker rmi srcs-nginx
	@echo "$(DARK_GREEN)WORDPRESS Docker & Image Cleaned ✅$(DEF_COLOR)"
	-docker rm wordpress
	-docker rmi srcs-wordpress
	@echo "$(DARK_GREEN)MARIADB Docker & Image Cleaned ✅$(DEF_COLOR)"
	-docker rm mariadb	
	-docker rmi srcs-mariadb
	@echo "$(DARK_GREEN)VOLUMES Cleaned ✅$(DEF_COLOR)"
	-docker volume rm wp-data
	-docker volume rm sql-data
	@echo "$(DARK_GREEN)NETWORK Docker & Image Cleaned ✅$(DEF_COLOR)"
	-docker network rm inception

prune:
	yes | docker system prune -a --volumes

re: clean all