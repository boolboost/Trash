~~~ php
/**
 * Implements hook_preprocess_html().
 */
function HOOK_preprocess_html(&$variables) {
  if ($term = \Drupal::routeMatch()->getParameter('taxonomy_term')) {
    if ($term->bundle() == 'category') {
      $variables['attributes']['class'][] = 'is-category';
    }
  }
}
~~~
