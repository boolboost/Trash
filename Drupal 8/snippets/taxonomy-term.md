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
