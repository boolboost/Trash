#!/bin/bash
domain=$1
 
echo "127.0.0.1 $domain" | sudo tee -a /etc/hosts > /dev/null
sed -i "s/DOMAIN/$domain/g" ./docker-compose.yml > /dev/null

docker-compose up -d

git clone https://github.com/drupal-composer/drupal-project.git
cp -R drupal-project/* .
rm -rf drupal-project/

# fix rules
sudo setfacl -dR -m u:$(whoami):rwX -m u:82:rwX -m u:100:rX .
sudo setfacl -R -m u:$(whoami):rwX -m u:82:rwX -m u:100:rX .

sed -i '/"installer-paths"/a "web/modules/custom/{$name}": ["type:drupal-custom-module"],\n"web/themes/custom/{$name}": ["type:drupal-custom-theme"],\n"web/libraries/{$name}": ["type:drupal-library"],' composer.json

composer install

composer require wikimedia/composer-merge-plugin
composer require drupal/twig_tweak
composer require drupal/devel

exit 0
