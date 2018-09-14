## Templates

```
views-view--[name]--[display_id].tpl.php
views-view--[display_id].tpl.php
views-view--[tag].tpl.php
views-view.tpl.php
views-view-unformatted--[name]--[display_id].tpl.php
views-view-unformatted--[display_id].tpl.php
views-view-unformatted--[tag].tpl.php
views-view-unformatted.tpl.php
views-view-fields--[name]--[display_id].tpl.php
views-view-fields--[display_id].tpl.php
views-view-fields--[tag].tpl.php
views-view-fields.tpl.php
```

## Is Feed

``` php
$is_feed = FALSE;

if ($view_id = \Drupal::routeMatch()->getParameter('view_id')) {
  $view = Views::getView($view_id);

  $displays = $view->storage->get('display');

  foreach ($displays as &$display) {
    if ($display['display_plugin'] == 'feed') {
      $is_feed = TRUE;
      break;
    }
  }
}
```
