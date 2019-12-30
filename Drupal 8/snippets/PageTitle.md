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

**Set html title for node in full page.**

1. hook_preprocess_html in theme.
2. hook_preprocess_html in metatag module.
2. hook_preprocess_html in custom module.
3. [Route Subscriber](https://niklan.net/blog/171)

``` php
/**
 * Implements hook_metatags_attachments_alter().
 */
function hook_metatags_attachments_alter(array &$metatag_attachments) {
  if ($node = \Drupal::routeMatch()->getParameter('node')) {
    if ($node->bundle() == 'article') {
      if ($category = $node->field_category->entity) {
        foreach ($metatag_attachments['#attached']['html_head'] as $id => $attachment) {
          if ($attachment[1] == 'title') {
            $title = &$metatag_attachments['#attached']['html_head'][$id][0]['#attributes']['content'];
            $title = $category->link() . ' → ' . $title;
          }
        }
      }
    }
  }
}

/**
 * Implements hook_preprocess_HOOK() for html.html.twig.
 */
function hook_preprocess_html(&$variables) {
  if ($node = \Drupal::routeMatch()->getParameter('node')) {
    if ($node->bundle() == 'article') {
      if ($category = $node->field_category->entity) {
        $variables['head_title']['title'] = $category->link() . ' → ' . $variables['head_title']['title'];
      }
    }
  }
}
```
