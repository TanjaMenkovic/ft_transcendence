all: backend
	make images
	make up
#USER := $(shell whoami)
images:
	docker-compose -f ./docker-compose.yml build

up:
	docker compose -f ./docker-compose.yml up -d

backend:
	mkdir -p /home/mkorpela/data/mariadb

down:
	docker compose -f ./docker-compose.yml down

clean: 
	docker compose -f ./docker-compose.yml down --rmi all -v

fclean: clean
	docker system prune -f --volumes

re: fclean all

.PHONY: all clean fclean re up down
