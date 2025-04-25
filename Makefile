all: ssl
	make images
	make up

dev:
	cd backend && npm run dev & \
	cd frontend && npm run dev

images:
	docker-compose -f ./docker-compose.yml build

up:
	docker compose -f ./docker-compose.yml up -d


down:
	docker compose -f ./docker-compose.yml down

ssl:
	mkdir -p frontend/ssl
	@if [ ! -f frontend/ssl/private.key ] || [ ! -f frontend/ssl/public_certificate.crt ]; then \
		echo "🔐 Creating SSL certificate and key..."; \
		openssl req -x509 -nodes -days 365 \
			-newkey rsa:2048 \
			-keyout frontend/ssl/private.key \
			-out frontend/ssl/public_certificate.crt \
			-subj "/C=FI/ST=Uusimaa/L=Helsinki/O=42/OU=Hive/CN=localhost"; \
	else \
		echo "✅ SSL certificate and key already exist. Skipping generation."; \
	fi


clean: 
	docker compose -f ./docker-compose.yml down --rmi all -v

fclean: clean
	rm -rf frontend/ssl
	docker system prune -f --volumes

re: fclean all

.PHONY: all clean fclean re up down dev ssl images