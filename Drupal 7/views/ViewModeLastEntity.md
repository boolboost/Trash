```php
/**
 * Implements hook_preprocess_HOOK() for
 * views-view-unformatted.tpl.php.
 */
function hook_preprocess_views_view_unformatted(&$variables) {
  /** @var \view $view */
  $view = &$variables['view'];

  $name = $view->name;
  $display_id = $view->current_display;

  if ($name && $display_id) {
    $func = 'HOOK_preprocess_views_view_unformatted__' . $name . '__' . $display_id;

    // hook_preprocess_views_view_unformatted__NAME__DISPLAY_ID().
    if (function_exists($func)) {
      $func($variables);
    }
  }
}

/**
 * Implements hook_preprocess_HOOK().
 */
function hook_preprocess_views_view_unformatted__NAME__DISPLAY_ID(&$variables) {
  $last_index = count($variables['rows']) - 1;

  if ($last_index >= 0) {
    /** @var \view $view */
    $view = &$variables['view'];

    $tid = $view->result[$last_index]->tid;
    $row = &$variables['rows'][$last_index];

    $entity = ENTITY_load($tid);
    // View mode replace for last item.
    $view = ENTITY_view($entity, 'VIEW MODE');
    $row = render($view);
  }
}
```
