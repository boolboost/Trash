## THEME.theme

``` php
/**
 * Implements HOOK_preprocess_THEME() for page title.
 */
function HOOK_preprocess_page_title(&$variables) {
  $variables['is_feed'] = FALSE;

  if ($view_id = \Drupal::routeMatch()->getParameter('view_id')) {
    $current_display = \Drupal::routeMatch()->getParameter('display_id');

    $view = Views::getView($view_id);
    $arguments = \Drupal::routeMatch()->getRawParameters()->all();

    $displays = $view->storage->get('display');

    foreach ($displays as $display_id => &$display) {
      if ($display['display_plugin'] == 'feed') {
        if ($display['display_options']['displays'][$current_display] == $current_display) {
          $view->setArguments($arguments);
          $view->execute($current_display);

          $variables['is_feed'] = TRUE;
          $variables['feed_icons'] = $view->feedIcons;
          break;
        }
      }
    }
  }
}
```

## page-title.html.twig
``` twig
{#
/**
 * @file
 * Theme override for page titles.
 *
 * Available variables:
 * - title_attributes: HTML attributes for the page title element.
 * - title_prefix: Additional output populated by modules, intended to be
 *   displayed in front of the main title tag that appears in the template.
 * - title: The page title, for use in the actual content.
 * - title_suffix: Additional output populated by modules, intended to be
 *   displayed after the main title tag that appears in the template.
 */
#}
{{ title_prefix }}
{% if title %}
  <h1{{ title_attributes.addClass('page-title') }}>{{ title }}{% if is_feed %} {{ feed_icons }}{% endif %}</h1>
{% endif %}
{{ title_suffix }}
```
