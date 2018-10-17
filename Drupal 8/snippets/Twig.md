## Inline Template

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

## Format date in Node Teaser (node--teaser.html.twig)

``` twig
{% set date = node.createdtime|format_date('long') %}
```

## Format date in Node Teaser (field--node--created.html.twig)

``` twig
{%- for item in element['#items'] -%}
  {{ item.value|format_date('long') }}
{%- endfor -%}
```
