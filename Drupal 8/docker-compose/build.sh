#!/bin/bash
domain=$1
 
sudo echo "127.0.0.1 $domain" >> /etc/hosts

sed "s/DOMAIN/$domain" ./docker-compose.yml

docker-compose up -d

# fix rules
sudo setfacl -dR -m u:$(whoami):rwX -m u:82:rwX -m u:100:rX .
sudo setfacl -R -m u:$(whoami):rwX -m u:82:rwX -m u:100:rX .

exit 0
