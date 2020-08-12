## Theme debug

``` sh
drush vset theme_debug 1
drush vset theme_debug 0
```

## Alternative to the devel module

``` php
if (user_access('administer')) {
  drupal_set_message('<script>console.log(' . json_encode($data) . ')</script>', 'element-hidden');
}
```
