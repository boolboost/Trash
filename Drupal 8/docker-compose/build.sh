#!/bin/bash
domain=$1
 
echo "127.0.0.1 $domain" | sudo tee -a /etc/hosts > /dev/null
sed -i "s/DOMAIN/$domain/g" ./docker-compose.yml > /dev/null

docker-compose up -d

# fix rules
sudo setfacl -dR -m u:$(whoami):rwX -m u:82:rwX -m u:100:rX .
sudo setfacl -R -m u:$(whoami):rwX -m u:82:rwX -m u:100:rX .

git clone https://github.com/drupal-composer/drupal-project.git
cp -R drupal-project/* .
rm -rf drupal-project/

exit 0
