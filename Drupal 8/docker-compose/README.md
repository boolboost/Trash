# Install
https://niklan.net/blog/172

# Build project

1. ```bash build.sh domain.localhost```.
2. Browser open `domain.localhost` and install drupal.
3. ```composer update```.
4. Browser open `domain.localhost/update.php`.

# Bashrc 

File `~/.bashrc`.

~~~
alias drush="docker-compose exec --user 82 php drush"
alias drupal="docker-compose exec --user 82 php drupal"
alias composer="docker-compose exec --user 82 php composer"
~~~

# docker-compose.yml

## xdebug

~~~
php:
  environment:
    PHP_XDEBUG: 1
    PHP_XDEBUG_DEFAULT_ENABLE: 1
    PHP_XDEBUG_REMOTE_CONNECT_BACK: 1
~~~

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

## Docker IP

~~~
ifconfig docker0
~~~
