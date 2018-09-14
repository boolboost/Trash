При программном получение view display не учитываются аргументы.

Код решает данную продлему с оговорками.

Лучше брать заголовок со страницы.

## Views title
``` php
// Fixed arguments views.
$arguments = $view->getDisplay()->display['display_options']['arguments'];

// Get args.
$current_path = \Drupal::service('path.current')->getPath();
$path_args = explode('/', $current_path);
unset($path_args[0]);
$path_args = array_values($path_args);

$args = [];
foreach ($arguments as $id => &$argument) {
  if ($id == 'tid' && $argument['plugin_id'] == 'taxonomy_index_tid') {
    if (isset($path_args[2])) {
      $args[0] = $path_args[2];
    }
  }
}

if ($args) {
  $view->setArguments($args);
  $view->buildTitle();
}

$title = $view->getTitle();
```

## Page title
https://github.com/boolboost/Trash/blob/master/Drupal%208/snippets/getPageTitle.md
