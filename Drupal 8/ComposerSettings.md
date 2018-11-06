Install
``` sh
composer require wikimedia/composer-merge-plugin
```

Added "composer.json" for "drupal/drupal".
``` json
{
  "extra": {
    "merge-plugin": {
      "include": [
        "core/composer.json",
        "composer.libraries.json",
        "modules/custom/*/composer.json"
      ],
      "recurse": false,
      "replace": false,
      "merge-extra": false
    },
  }
}
```

Added "composer.json" for "drupal-composer/drupal-project".
``` json
{
  "extra": {
    "merge-plugin": {
      "include": [
        "composer.libraries.json",
        "web/modules/custom/*/composer.json"
      ],
      "recurse": false,
      "replace": false,
      "merge-extra": false
    },
  }
}
```

Added "composer.libraries.json"
``` json
{
  "require": {
  },
  "repositories": [
    {
      "type": "package",
      "package": {
        "name": "",
        "version": "",
        "type": "drupal-library",
        "dist": {
          "url": "",
          "type": ""
        }
      }
    }
  ]
}
```
