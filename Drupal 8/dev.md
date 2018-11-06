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

Added "web/sites/development.services.yml"
``` yaml
parameters:
  twig.config:
    debug: true
    auto_reload: true
    cache: false
```
