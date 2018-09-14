``` php
$current_path = \Drupal::service('path.current')->getPath();
$path_args = explode('/', $current_path);
unset($path_args[0]);
$path_args = array_values($path_args);
```
