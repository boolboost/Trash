**Create SSL.**
``` sh
openssl genrsa -out $(basename $(pwd)).key 2048
openssl req -new -x509 -key $(basename $(pwd)).key -out $(basename $(pwd)).cert -days 3650 -subj /CN=$(basename $(pwd))
mkdir certs
mv $(basename $(pwd)).key certs/
mv $(basename $(pwd)).cert certs/
```

**File `docker-compose.yml`.**
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

**xDebug.**

**File `docker-compose.yml`.**
``` yml
php:
  environment:
    PHP_XDEBUG: 1
    PHP_XDEBUG_DEFAULT_ENABLE: 1
    PHP_XDEBUG_REMOTE_CONNECT_BACK: 1
```

**Commands.**
``` sh
#Export mariadb.
docker exec -i $(docker-compose ps -q mariadb) mysqldump -udrupal -pdrupal drupal > dump.sql

#Import mariadb.
docker exec -i $(docker-compose ps -q mariadb) mysql -udrupal -pdrupal drupal < dump.sql

#Docker IP.
ifconfig docker0

#Rebuild container. The command is safe for data.
docker-compose up -d --force-recreate mariadb
```
