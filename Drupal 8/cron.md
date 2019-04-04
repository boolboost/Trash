# Cron job

```
*/10 * * * * /usr/local/bin/php /home/USER/public_html/vendor/bin/drupal --root=/home/USER/public_html cron:execute > /dev/null
*/10 * * * * cd /home/USER/public_html drupal cron:execute > /dev/null
```

# Queue run loop before success

``` sh
while true do; drush queue-run queue_name > /dev/null 2>&1 && break; done
```
