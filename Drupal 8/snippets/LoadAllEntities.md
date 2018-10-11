``` php
$ids = \Drupal::entityQuery('commerce_product')->execute();

$storage = \Drupal::entityTypeManager()->getStorage('commerce_product');
$entities = $storage->loadMultiple($ids);

foreach ($entities as $entity) {
  $entity->set('stores', 1)->save();
}
```
