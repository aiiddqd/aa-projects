up:
	docker-compose up -d --remove-orphans

stop:
	docker-compose stop

rm:
	docker-compose down

log:
	docker-compose logs -f

restart:
	docker-compose restart

# WARNING: Image for service nginx was built because it did not already exist. To rebuild this image you must use `docker-compose build` or `docker-compose up --build`.
build:
	docker-compose build