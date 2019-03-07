``` php
use Drupal\Core\Url;
use Drupal\Core\Link;

$text = t('Button');
$uri = '<front>';
$classes = ['btn'];

$url = Url::fromUri($uri);
$link = Link::fromTextAndUrl($text, $url);
$link = $link->toRenderable();
$link['#attributes'] = ['class' => $classes];
```
