# Cron job

```
*/10 * * * * /usr/local/bin/php /home/USER/public_html/vendor/bin/drupal --root=/home/USER/public_html cron:execute > /dev/null
```

# Queue run loop before success

```
0 5 * * * /home/USER/bin/cron.sh > /dev/null
```

File "/home/USER/bin/cron.sh".

```sh
#!/bin/sh

PATH=/home/USER/public_html/vendor/bin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

cd /home/USER/public_html
drush custom-generation-queue

while true; do
  drush queue-run common_import_queue 2>&1 && break
done
```
