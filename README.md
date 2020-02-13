
# Simple docker composition for php/nginx

url: http://sd.local/


# chg /etc/hosts: 
```
127.0.0.1 sd.local
```

# Makefile commands
- `make up` - start app
- `make log` - display log from docker
- `make stop`
- `make restart`
- `make status`

- `make build` - rebuild images


# Source

based on manual http://geekyplatypus.com/dockerise-your-php-application-with-nginx-and-php7-fpm/

https://github.com/eko/docker-symfony/blob/master/docker-compose.yml


# Snippets

## php composer setup
```
docker-compose run php-fpm composer install
```

## php app shell
```
docker exec -ti php-fpm /bin/sh
```

## migrations

### make and apply 
```
php bin/console make:migration
php bin/console doctrine:migrations:migrate
```

### regenerate getters and setters
```
php bin/console make:entity --regenerate
```

### doc 

https://symfony.com/doc/current/doctrine.html