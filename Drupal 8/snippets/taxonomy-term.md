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