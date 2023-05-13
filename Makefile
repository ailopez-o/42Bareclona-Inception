all:
	sudo docker-compose -f srcs/docker-compose.yml up -d
stop:
	sudo docker-compose -f srcs/docker-compose.yml down
clean:
	@docker stop $$(sudo docker ps -qa);\
	docker rm $$(sudo docker ps -qa);\
	docker rmi -f $$(sudo docker images -qa);\
	docker volume rm $$(sudo docker volume ls -q);\
	docker network rm $$(sudo docker network ls -q);\

prune:
	sudo yes | docker system prune -a --volumes

re: clean all