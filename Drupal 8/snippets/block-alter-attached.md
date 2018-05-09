~~~php
/**
 * Implements hook_block_view_alter().
 */
function hook_block_view_alter(array &$build, \Drupal\Core\Block\BlockPluginInterface $block) {
  if ($block->getPluginId() == 'NAME:DISPLAY') {
    $build['#attached']['library'][] = 'MODULE/LIBRARY';
  }
}
~~~
