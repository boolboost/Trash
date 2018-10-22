Hash_salt for settings.php

``` sh
drush eval "var_dump(Drupal\Component\Utility\Crypt::randomBytesBase64(55))"
```

## Install
``` sh
composer require drush/drush
vendor/drush/drush/drush init -y
```
