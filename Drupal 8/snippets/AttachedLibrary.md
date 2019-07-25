**Twig.**
``` twig
{{ attach_library('module/library') }}
```

**Preprocess.**
``` php
$variables['#attached']['library'][] = 'module/library';
```

**Block Plugin.**
``` php
/**
 * Implements hook_block_view_alter().
 */
function hook_block_view_alter(array &$build, \Drupal\Core\Block\BlockPluginInterface $block) {
  if ($block->getPluginId() == 'name:display') {
    $build['#attached']['library'][] = 'module/library';
  }
}
```

**File `theme.libraries.yml`.**
``` yml
global-styling:
  version: 1.0
  css:
    theme:
      css/styles.css: {}
  js:
    js/main.js: {}
  dependencies:
    - core/jquery
    - core/drupal.dialog
    - colorbox/colorbox
    - colorbox/default
```

**File `theme.info.yml`.**
``` yml
libraries:
  - module/library
```
