C_FILE= srcs/docker-compose.yml

DB_VOLUME=/home/elahyani/data/mariadb
WP_VOLUME=/home/elahyani/data/wordpress

all:
	@sudo mkdir $(DB_VOLUME)
	@sudo mkdir $(WP_VOLUME)
	@sudo sh -c 'echo "127.0.0.1  elahyani.42.fr" >> /etc/hosts'
	@docker-compose -f $(C_FILE) build
	@docker-compose -f $(C_FILE) up -d

build:
	@docker-compose -f $(C_FILE) build

up:
	@docker-compose -f $(C_FILE) up -d

down:
	@docker-compose -f $(C_FILE) down

destroy:
	@docker-compose -f $(C_FILE) down -v

stop:
	@docker-compose -f $(C_FILE) stop

restart:
	@docker-compose -f $(C_FILE) stop
	@docker-compose -f $(C_FILE) up -d

logs:
	@docker-compose -f $(C_FILE) logs --tail="all"

ps:
	@docker-compose -f $(C_FILE) ps

images:
	@docker-compose -f $(C_FILE) images

clean:
	@sudo rm -rf /home/elahyani/data/*
	@docker-compose -f $(C_FILE) down -v --rmi all
	@docker volume prune -f

re: down up
