# Install
https://niklan.net/blog/172

## Alias
~~~
alias drush="docker-compose exec --user 82 php drush"
alias drupal="docker-compose exec --user 82 php drupal"
alias composer="docker-compose exec --user 82 php composer"

alias i:docker4drupal="wget $(curl -s https://api.github.com/repos/wodby/docker4drupal/releases/latest | grep browser_download_url | cut -d '"' -f 4)
tar -xvzf docker4drupal.tar.gz
rm docker4drupal.tar.gz"
~~~

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
