File `menu--categories.html.twig` (clone `core/themes/stable/templates/navigation/menu.html.twig`).

~~~php
function theme_preprocess_menu__categories(&$variables) {
  $get_items_depth = function (&$items) use (&$get_items_depth) {
    foreach ($items as &$item) {
      if ($item['in_active_trail'] == true) {
        if ($item['below']) {
          return $get_items_depth($item['below']);
        }
      }
    }

    return $items;
  };

  $variables['items'] = $get_items_depth($variables['items']);
}
~~~
