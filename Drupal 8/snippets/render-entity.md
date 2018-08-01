``` php
$view_builder = \Drupal::entityTypeManager()->getViewBuilder($entity_type);
$storage = \Drupal::entityTypeManager()->getStorage($entity_type);
$entity = $storage->load($entity_id);
$view = $view_builder->view($entity, $view_mode);
$output = \Drupal::service('renderer')->render($view);
```
