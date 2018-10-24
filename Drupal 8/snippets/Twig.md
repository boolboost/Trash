## Get url to Entity
``` twig
{{ path('entity.user.canonical', {'user': user.id}) }}
{{ path('entity.node.canonical', {'node': node.id}) }}
{{ path('entity.comment.canonical', {'comment': comment.id}, {'fragment': 'comment-' ~ comment.id}) }}
```

## Get url to File
``` twig
{{ file_url(elements['#media'].field_link.uri.value) }}
```

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
## Media logotype

``` twig
{% set url = file_url(elements['#media'].field_link.uri.value) %}

{% if url %}
  <a href="{{ url }}">
{% endif %}

{{ content.thumbnail }}

{% if url %}
  </a>
{% endif %}
```
