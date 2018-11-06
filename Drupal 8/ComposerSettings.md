Install
``` sh
composer require wikimedia/composer-merge-plugin
```

Added "composer.json"
``` json
{
  "extra": {
    "merge-plugin": {
      "include": [
        "composer.libraries.json"
      ],
      "recurse": true,
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
