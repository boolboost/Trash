**Simple args.**
``` php
$current_path = \Drupal::service('path.current')->getPath();
$args = explode('/', $current_path);
unset($path_args[0]);
$args = array_values($path_args);
```

**Raw Parameters.**
``` php
$arguments = \Drupal::routeMatch()->getRawParameters()->all();

// Example
$view->setArguments($arguments);
```

**Parameters.**
```
$parameters = \Drupal::routeMatch()->getParameters();

// Example
$node = \Drupal::routeMatch()->getParameter('node');
```
