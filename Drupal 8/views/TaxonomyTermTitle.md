## Views title
``` php
$arguments = \Drupal::routeMatch()->getRawParameters()->all();

if ($arguments) {
  $view->setArguments($arguments);
  $view->buildTitle();
}

$title = $view->getTitle();
```
