## Bad practice.

``` sh
find . -type f -exec chmod 644 {} \;
find . -type d -exec chmod 755 {} \;
```

## Variant 1

[https://gitlab.com/-/snippets/2088658]()

## Variant 2

``` sh
drupal site:mode dev
drupal site:mode prod
```
