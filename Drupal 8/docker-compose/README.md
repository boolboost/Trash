# Install
https://niklan.net/blog/172

## Alias
~~~ sh
alias drush="docker-compose exec --user 82 php drush"
alias drupal="docker-compose exec --user 82 php drupal"
alias composer="docker-compose exec --user 82 php composer"

alias i:docker4drupal="wget $(curl -s https://api.github.com/repos/wodby/docker4drupal/releases/latest | grep browser_download_url | cut -d '"' -f 4)
tar -xvzf docker4drupal.tar.gz
rm docker4drupal.tar.gz
sed -i \"0,/PROJECT_NAME=/s/PROJECT_NAME=.*/PROJECT_NAME=$(basename $(pwd))/\" .env
sed -i \"0,/PROJECT_BASE_URL=/s/PROJECT_BASE_URL=.*/PROJECT_BASE_URL=$(basename $(pwd))/\" .env"

alias i:drupal-project="git clone https://github.com/drupal-composer/drupal-project.git some-dir
cp -r some-dir/. ./
rm -rf some-dir/
composer install"
~~~

## SSL
``` sh
openssl genrsa -out $(basename $(pwd)).key 2048
openssl req -new -x509 -key $(basename $(pwd)).key -out $(basename $(pwd)).cert -days 3650 -subj /CN=$(basename $(pwd))
mkdir certs
mv $(basename $(pwd)).key certs/
mv $(basename $(pwd)).cert certs/
```

### docker-compose.yml
``` yml
traefik:
  image: traefik
  container_name: "${PROJECT_NAME}_traefik"
  command: -c /dev/null --web --docker --logLevel=INFO --defaultEntryPoints='https' --entryPoints="Name:https Address::443 TLS:/certs/${PROJECT_BASE_URL}.cert,/certs/${PROJECT_BASE_URL}.key" --entryPoints="Name:http Address::80"
  ports:
    - '80:80'
    - '443:443'
  volumes:
    - /var/run/docker.sock:/var/run/docker.sock
    - ./certs:/certs
```

## Base Modules

~~~ sh
composer require wikimedia/composer-merge-plugin
composer require drupal/twig_tweak
composer require drupal/devel
~~~

## Commerce Modules

~~~ sh
composer require drupal/commerce
composer require drupal/tvi
composer require drupal/taxonomy_menu
composer require drupal/search_api
~~~

# docker-compose.yml

## xdebug

~~~ yml
php:
  environment:
    PHP_XDEBUG: 1
    PHP_XDEBUG_DEFAULT_ENABLE: 1
    PHP_XDEBUG_REMOTE_CONNECT_BACK: 1
~~~

# Commands docker-compose

## Start

~~~ sh
docker-compose up -d
~~~

## Stop

~~~ sh
docker-compose stop
~~~

## Restart

~~~ sh
docker-compose restart
~~~

## Export mariadb

~~~ sh
docker exec -i $(docker-compose ps -q mariadb) mysqldump -udrupal -pdrupal drupal > dump.sql
~~~

## Import mariadb

~~~ sh
docker exec -i $(docker-compose ps -q mariadb) mysql -udrupal -pdrupal drupal < dump.sql
~~~

## Rebuild container

The command is safe for data.

~~~ sh
docker-compose up -d --force-recreate mariadb
~~~

## Docker IP

~~~ sh
ifconfig docker0
~~~

## Fix user permission

> Not recommended.

~~~ sh
sudo setfacl -dR -m u:$(whoami):rwX -m u:82:rwX -m u:100:rX .
sudo setfacl -R -m u:$(whoami):rwX -m u:82:rwX -m u:100:rX .
~~~
