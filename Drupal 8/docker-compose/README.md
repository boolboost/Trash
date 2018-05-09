# Install
https://niklan.net/blog/172

# Build project

1. ```bash build.sh domain.localhost```.
2. Browser open `domain.localhost` and install drupal.
3. ```composer update```.
4. Browser open `domain.localhost/update.php`.

# Commands docker-compose

## Start

~~~
docker-compose up -d
~~~

## Stop

~~~
docker-compose stop
~~~

## Restart

~~~
docker-compose restart
~~~

## Export mariadb

~~~
docker ps
docker exec -i CONTAINER_ID mysqldump -udrupal -pdrupal drupal > dump.sql
~~~

## Import mariadb

~~~
docker ps
docker exec -i CONTAINER_ID mysql -udrupal -pdrupal drupal < dump.sql
~~~

## Rebuild container

The command is safe for data.

~~~
docker-compose up -d --force-recreate mariadb
~~~

# Settings docker-compose

## xdebug

~~~
php:
  environment:
    PHP_XDEBUG: 1
    PHP_XDEBUG_DEFAULT_ENABLE: 1
    PHP_XDEBUG_REMOTE_CONNECT_BACK: 1
~~~
