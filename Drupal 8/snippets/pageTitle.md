**Get title.**
``` php
$request = \Drupal::request();
$route_match = \Drupal::routeMatch();
$title = \Drupal::service('title_resolver')->getTitle($request, $route_match->getRouteObject());
```

**Set title for node in full page.**
``` php
/**
 * Implements hook_preprocess_THEME() for page-title.html.twig.
 */
function hook_preprocess_page_title(&$variables) {
  if ($node = \Drupal::routeMatch()->getParameter('node')) {
    if ($node->bundle() == 'article') {
      if ($category = $node->field_category->entity) {
        // Set the page title.
        $variables['title'] = ['#markup' => '<span>' . $category->link() . ' → ' . $node->label() . '</span>'];
      }
    }
  }
}
```
