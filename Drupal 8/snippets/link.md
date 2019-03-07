``` php
use Drupal\Core\Url;
use Drupal\Core\Link;

$text = t('Button');
$path = '<front>';
$classes = ['btn'];

$url = Url::fromRoute($path);
$link = Link::fromTextAndUrl($text, $url);
$link = $link->toRenderable();
$link['#attributes'] = ['class' => $classes];
```
