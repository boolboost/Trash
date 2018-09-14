## Views title
``` php
$arguments = \Drupal::routeMatch()->getRawParameters()->all();

if ($arguments) {
  $view->setArguments($arguments);
  $view->buildTitle();
}

$title = $view->getTitle();
```

## Page title
https://github.com/boolboost/Trash/blob/master/Drupal%208/snippets/getPageTitle.md
