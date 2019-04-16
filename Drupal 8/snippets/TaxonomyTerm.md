# Depth

``` php
/** @var Drupal\taxonomy\TermStorageInterface $storage */
$storage = \Drupal::entityTypeManager()->getStorage('taxonomy_term');

// Depth.
$parents = $storage->loadAllParents($term->id());
$depth = count($parents);

// Depth last.
$tree = $storage->loadTree($term->bundle(), $term->id());
$max_depth = max(array_column($tree, 'depth'));

$last_but_one = ($max_depth === 0);
$last = ($max_depth === FALSE);
```
# Count Node
``` php
/** @var Drupal\taxonomy\TermStorageInterface $storage */
$storage = \Drupal::entityTypeManager()->getStorage('taxonomy_term');

// Count for vocabulary.
$storage->nodeCount($vid);

// Count for term.
function nodeCountTid($tid) {
  $query = \Drupal::database()->select('taxonomy_index', 'ti');
  $query->addExpression('COUNT(DISTINCT ti.nid)');
  $query->condition('ti.tid', $tid);
  $query->addTag('vocabulary_node_count');

  return $query->execute()->fetchField();
}
```

# Display form status
``` php
/**
 * Implements hook_entity_base_field_info_alter().
 */
function hook_entity_base_field_info_alter(&$fields, \Drupal\Core\Entity\EntityTypeInterface $entity_type) {
  if ($entity_type->id() == 'taxonomy_term' && !empty($fields['status'])) {
    $fields['status']->setDisplayConfigurable('form', TRUE);
  }
}
```

# Hidden terms in taxonomy menu.
``` php
/**
 * Implements hook_taxonomy_menu_link_alter().
 */
function hook_taxonomy_menu_link_alter(&$link, &$term) {
  if (!$term->get('status')->value) {
    $link['enabled'] = FALSE;
  }
}
```
