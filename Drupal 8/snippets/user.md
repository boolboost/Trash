# Status

``` php
\Drupal::currentUser()->isAuthenticated();
\Drupal::currentUser()->isAnonymous();
```

# Convert account to user

``` php
$account = \Drupal::currentUser();
$storage = \Drupal::entityTypeManager()->getStorage('user');
$user = $storage->load($account->id());
```

# Get profile in preprocess user

``` php
/**
 * Implements HOOK_preprocess_THEME() for user.html.twig.
 */
function HOOK_preprocess_user(&$variables) {
  /** @var Drupal\profile\ProfileStorage $storage */
  $storage = \Drupal::entityTypeManager()->getStorage('profile');
  $variables['profile'] = $storage->loadDefaultByUser($variables['user'], 'profile');
}
```
