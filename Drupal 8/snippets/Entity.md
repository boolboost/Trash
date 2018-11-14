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

## Load All Entities

``` php
$ids = \Drupal::entityQuery('commerce_product')->execute();

$storage = \Drupal::entityTypeManager()->getStorage('commerce_product');
$entities = $storage->loadMultiple($ids);

foreach ($entities as $entity) {
  $entity->set('stores', 1)->save();
}
```

``` php
$storage = \Drupal::entityTypeManager()->getStorage('commerce_product');
$entities = $storage->loadByProperties(['type' => 'product']);

foreach ($entities as $entity) {
  $entity->set('stores', 1)->save();
}
```
