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
	mkdir -p volumes/backend

frontend:
	mkdir -p volumes/frontend


ssl:
	mkdir -p ssl
	@if [ ! -f ssl/private.key ] || [ ! -f ssl/public_certificate.crt ]; then \
		echo "🔐 Creating SSL certificate and key..."; \
		openssl req -x509 -nodes -days 365 \
			-newkey rsa:2048 \
			-keyout ssl/private.key \
			-out ssl/public_certificate.crt \
			-subj "/C=FI/ST=Uusimaa/L=Helsinki/O=42/OU=Hive/CN=localhost"; \
	else \
		echo "✅ SSL certificate and key already exist. Skipping generation."; \
	fi


clean: 
	docker compose -f ./docker-compose.yml down --rmi all -v

fclean: clean
	rm -rf volumes
	rm -rf ssl
	docker system prune -f --volumes

re: fclean all

.PHONY: all clean fclean re up down backend frontend ssl