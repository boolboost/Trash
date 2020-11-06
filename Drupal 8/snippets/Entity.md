**Render**
``` php
$view_builder = \Drupal::entityTypeManager()->getViewBuilder($entity_type);
$storage = \Drupal::entityTypeManager()->getStorage($entity_type);
$entity = $storage->load($entity_id);
$view = $view_builder->view($entity, $view_mode);
$output = \Drupal::service('renderer')->render($view);

$instance->entityDisplayRepository = $container->get('entity_display.repository');
```

**Get view modes active**
``` php
// Entity with display header.
$view_mode_options = $entity_display_repository->getViewModeOptionsByBundle($entity->getEntityTypeId(), $entity->bundle());
$view_modes = array_keys($view_mode_options);

$is_display_full = in_array('full', $view_modes);
```

**Get field configs**
``` php
if ($form['#fields']) {
  $ids = [];

  foreach ($form['#fields'] as $field_name) {
    $ids[] =  $form['#entity_type'] . '.' . $field_name;
  }

  $field_configs = FieldStorageConfig::loadMultiple($ids);
}
```

**Load All Entities**
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

**Create paragraph**
``` php
/** @var \Drupal\Core\Entity\EntityStorageInterface $storage_paragraph */
$storage_paragraph = \Drupal::entityTypeManager()->getStorage('paragraph');

$paragraph = $storage_paragraph->create(['type' => $paragraph_type]);

$paragraph->save();

$entity->get('field_paragraphs')->appendItem([
  'target_id' => $paragraph->id(),
  'target_revision_id' => $paragraph->getRevisionId(),
]);
```

**Remove paragraphs**
``` php
if (!$entity->get('field_paragraphs')->isEmpty()) {
  $paragraphs = $entity->get('field_paragraphs')->referencedEntities();
  
  /** @var \Drupal\paragraphs\ParagraphInterface $paragraph */
  foreach ($paragraphs as $paragraph) {
    $paragraph->delete();
  }

  $entity->set('field_paragraphs', NULL);
}
```
