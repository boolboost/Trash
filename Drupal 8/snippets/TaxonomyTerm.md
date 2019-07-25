**Depth**
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

**Count Node**
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

**Display form with Status.**
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

**Put Status in "Publish Settings".**
``` php
/**
 * Implements hook_form_FORM_ID_alter() for node_article_edit_form.
 */
function hook_form_FORM_ID_alter(&$form, FormStateInterface $form_state, $form_id) {
  if (isset($form['status'])) {
    $form['status']["#group"] = "options";
  }
}
```

**Hidden terms in taxonomy menu.**
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

**Additional aliases for taxonomy term.**
``` php
use Drupal\Core\Entity\EntityInterface;
use Drupal\Component\Render\FormattableMarkup;

function _hook_get_patterns_aliases() {
  return [
    [
      'bundles' => ['city'],
      'source' => '@term_source/search',
      'alias' => '@term_alias/search',
    ]
  ];
}

function _hook_get_arguments_aliases(EntityInterface $entity) {
  $tid = $entity->id();
  
  return [
    '@term_id' => $tid,
    '@term_source' => '/taxonomy/term/' . $tid,
    '@term_alias' => $entity->toUrl()->toString(),
  ];
}

/**
 * Callback taxonomy term save.
 */
function _hook_set_additional_aliases_for_terms(EntityInterface $entity) {
  /** @var \Drupal\Core\Path\AliasStorageInterface $path_alias_storage */
  $path_alias_storage = \Drupal::service('path.alias_storage');

  $arguments = _hook_get_arguments_aliases($entity);
  $patterns = _hook_get_patterns_aliases();

  foreach ($patterns as $pattern) {
    $bundles = $pattern['bundles']?? [];
    
    if (!$bundles || in_array($entity->bundle(), $bundles)) {
      $source = new FormattableMarkup($pattern['source'], $arguments);
      $alias = new FormattableMarkup($pattern['alias'], $arguments);

      // Create and Update.
      $item = $path_alias_storage->load(['source' => $source]);
      $pid = ($item && isset($item['pid'])) ? $item['pid'] : NULL;
      $path_alias_storage->save($source, $alias, LanguageInterface::LANGCODE_NOT_SPECIFIED, $pid);
    }
  }
}

/**
 * Implements hook_ENTITY_TYPE_insert() for taxonomy_term.
 */
function hook_taxonomy_term_insert(EntityInterface $entity) {
  _hook_set_additional_aliases_for_terms($entity);
}

/**
 * Implements hook_ENTITY_TYPE_update() for taxonomy_term.
 */
function hook_taxonomy_term_update(EntityInterface $entity) {
  _hook_set_additional_aliases_for_terms($entity);
}

/**
 * Implements hook_taxonomy_term_delete() for taxonomy_term.
 */
function hook_taxonomy_term_delete(EntityInterface $entity) {
  /** @var \Drupal\Core\Path\AliasStorageInterface $path_alias_storage */
  $path_alias_storage = \Drupal::service('path.alias_storage');
  
  $arguments = _hook_get_arguments_aliases($entity);
  $patterns = _hook_get_patterns_aliases();
  
  foreach ($patterns as $pattern) {
    $bundles = $pattern['bundles']?? [];
    
    if (!$bundles || in_array($entity->bundle(), $bundles)) {
      $source = new FormattableMarkup($pattern['source'], $arguments);

      $path_alias_storage->delete(['source' => $source]);
    }
  }
}
```
