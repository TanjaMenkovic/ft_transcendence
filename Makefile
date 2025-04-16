
PROJECT_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

all: ssl backend frontend
	make images
	make up

dev:
	cd backend && npm run dev & \
	cd frontend && npm run dev

ssl_test: ssl

test:
	@echo "PROJECT_DIR is: $(PROJECT_DIR)"

test-home:
	@echo "HOME is: $(HOME)"

test-backend:
	@echo $(PROJECT_DIR)/volumes/backend

test-start: ssl backend frontend

images:
	docker-compose -f ./docker-compose.yml build

up:
	docker compose -f ./docker-compose.yml up -d


down:
	docker compose -f ./docker-compose.yml down


backend:
	mkdir -p $(PROJECT_DIR)/volumes/backend

frontend:
	mkdir -p $(PROJECT_DIR)/volumes/frontend


ssl:
	mkdir -p $(PROJECT_DIR)/ssl
	@if [ ! -f $(PROJECT_DIR)/ssl/private.key ] || [ ! -f $(PROJECT_DIR)/ssl/public_certificate.crt ]; then \
		echo "🔐 Creating SSL certificate and key..."; \
		openssl req -x509 -nodes -days 365 \
			-newkey rsa:2048 \
			-keyout $(PROJECT_DIR)/ssl/private.key \
			-out $(PROJECT_DIR)/ssl/public_certificate.crt \
			-subj "/C=FI/ST=Uusimaa/L=Helsinki/O=42/OU=Hive/CN=localhost"; \
	else \
		echo "✅ SSL certificate and key already exist. Skipping generation."; \
	fi


clean: 
	docker compose -f ./docker-compose.yml down --rmi all -v

fclean: clean
	rm -rf $(PROJECT_DIR)/volumes
	rm -rf $(PROJECT_DIR)/ssl
	docker system prune -f --volumes

re: fclean all

.PHONY: all clean fclean re up down backend frontend ssl
