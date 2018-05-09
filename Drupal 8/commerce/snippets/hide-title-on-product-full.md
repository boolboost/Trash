~~~php
/**
 * Implements hook_block_access().
 */
function hook_block_access(Block $block, $operation, AccountInterface $account) {
  if ($operation == 'view' && $block->getPluginId() == 'page_title_block') {
    $commerce_product = \Drupal::routeMatch()->getParameter('commerce_product');

    return AccessResult::forbiddenIf($commerce_product instanceof EntityInterface)->addCacheableDependency($block);
  }

  return AccessResult::neutral();
}
~~~
