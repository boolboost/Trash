## Example

``` php
/** @var \Drupal\Core\Render\Renderer $renderer */
$renderer = \Drupal::service("renderer");
$render = [
  '#type' => 'inline_template',
  '#template' => '<div class="title">{{ entity.label() }}</div>' .
    '{% if entity.body.value|raw %}' .
    '<div class="description">{{ entity.body.value|raw }}</div>' .
    '{% endif %}',
  '#context' => [
    'entity' => $entity
  ]
];
```
