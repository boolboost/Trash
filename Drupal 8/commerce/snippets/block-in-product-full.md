~~~php
/**
  * {@inheritdoc}
  */
public function blockAccess(AccountInterface $account, $return_as_object = FALSE) {
  $commerce_product = \Drupal::routeMatch()->getParameter('commerce_product');

  return $commerce_product instanceof EntityInterface? AccessResult::allowed(): AccessResult::neutral();
}
~~~
