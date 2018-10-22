## Render
``` php
$view_builder = \Drupal::entityTypeManager()->getViewBuilder($entity_type);
$storage = \Drupal::entityTypeManager()->getStorage($entity_type);
$entity = $storage->load($entity_id);
$view = $view_builder->view($entity, $view_mode);
$output = \Drupal::service('renderer')->render($view);
```

## Get field configs
``` php
if ($form['#fields']) {
  $ids = [];

  foreach ($form['#fields'] as $field_name) {
    $ids[] =  $form['#entity_type'] . '.' . $field_name;
  }

  $field_configs = FieldStorageConfig::loadMultiple($ids);
}
```
