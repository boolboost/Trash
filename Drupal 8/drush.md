Hash_salt for settings.php

``` sh
drush eval "var_dump(Drupal\Component\Utility\Crypt::randomBytesBase64(55))"
```

Remove module.
``` sh
drush pm:uninstall module_name
composer remove druapl/module_name
```

Fix "The module does not exist".
``` sh
drush sql-query "DELETE FROM key_value WHERE collection='system.schema' AND name='module_name';"
```

SQL export/import
``` sh
drush sql-dump --skip-tables-list=cache,cache_* > dump.sql
mysql -udrupal -pdrupal drupal < dump.sql
```
