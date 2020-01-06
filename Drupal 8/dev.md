## Bad practice.

``` sh
find . -type f -exec chmod 644 {} \;
find . -type d -exec chmod 755 {} \;
```

## Variant 1

``` sh
cp web/sites/example.settings.local.php web/sites/default/settings.local.php
```

Uncomment "web/sites/default/settings.local.php"
``` php
$settings['cache']['bins']['render'] = 'cache.backend.null';
$settings['cache']['bins']['discovery_migration'] = 'cache.backend.memory';
$settings['cache']['bins']['page'] = 'cache.backend.null';
$settings['cache']['bins']['dynamic_page_cache'] = 'cache.backend.null';
```

Uncomment "web/sites/default/settings.php"
``` php
if (file_exists($app_root . '/' . $site_path . '/settings.local.php')) {
  include $app_root . '/' . $site_path . '/settings.local.php';
}
```

Added "web/sites/development.services.yml"
``` yaml
parameters:
  twig.config:
    debug: true
    auto_reload: true
    cache: false
```

## Variant 2

``` sh
drupal site:mode dev
drupal site:mode prod
```
