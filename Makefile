WP_DATA = /home/malanglo/data/wordpress
DB_DATA = /home/malanglo/data/mariadb

all: up

up: build
	@sudo mkdir -p $(WP_DATA)
	@sudo mkdir -p $(DB_DATA)
	docker-compose -f ./srcs/docker-compose.yml up -d

# clean mais garde les images, les volumes et network
down:
	docker-compose -f ./srcs/docker-compose.yml down

stop:
	docker-compose -f /srcs/docker-compose.yml stop

start:
	docker-compose -f ./srcs/docker-compose.yml start

build:
	docker-compose -f ./srcs/docker-compose.yml build


clean:
	@docker stop $$(docker ps -qa) || true
	@docker rm $$(docker ps -qa) || true
	@docker rmi -f $$(docker images -qa) || true
	@docker volume rm $$(docker volume ls -q) || true
	@docker network rm $$(docker network ls -q) || true
	@sudo rm -rf $(WP_DATA) || true
	@sudo rm -rf $(DB_DATA) || true

re: clean up

prune: clean
	@docker system prune -a --volumes -f