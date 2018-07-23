# Install
https://niklan.net/blog/172

## Base Modules

~~~
composer require wikimedia/composer-merge-plugin
composer require drupal/twig_tweak
composer require drupal/devel
~~~

## Commerce Modules

~~~
composer require drupal/commerce
composer require drupal/tvi
composer require drupal/taxonomy_menu
composer require drupal/search_api
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
