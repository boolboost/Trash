# Status

~~~php
\Drupal::currentUser()->isAuthenticated();
\Drupal::currentUser()->isAnonymous();
~~~

# Convert account to user

~~~php
$account = \Drupal::currentUser();
$storage = \Drupal::entityTypeManager()->getStorage('user');
$user = $storage->load($account->id());
~~~
