**First image.**
``` twig
{{ content.field_images|filter((v, k) => k|slice(0, 1) in ['#', '0']) }}
```

**Except the first image.**
``` twig
{{ content.field_images|map((v, k) => k|slice(0, 1) == '#' or k > 0? v: {'#printed': true}) }}
```

File `field.html.twig`.
``` twig
{% set classes = [
  'field',
  'field--name-' ~ field_name|clean_class,
  'field--type-' ~ field_type|clean_class,
  'field--label-' ~ label_display,
] %}
{% set title_classes = [
  'field__label',
  label_display == 'visually_hidden' ? 'visually-hidden',
] %}

{% if label_hidden %}
  {% if multiple %}
    <div{{ attributes.addClass(classes, 'field__items') }}>
      {% for item in items %}
        {% if item.content != {'#printed': true} %}
          <div{{ item.attributes.addClass('field__item') }}>{{ item.content }}</div>
        {% endif %}
      {% endfor %}
    </div>
  {% else %}
    {% for item in items %}
      <div{{ attributes.addClass(classes, 'field__item') }}>{{ item.content }}</div>
    {% endfor %}
  {% endif %}
{% else %}
  <div{{ attributes.addClass(classes) }}>
    <div{{ title_attributes.addClass(title_classes) }}>{{ label }}</div>
    {% if multiple %}
    <div class="field__items">
      {% endif %}
      {% for item in items %}
        {% if item.content != {'#printed': true} %}
          <div{{ item.attributes.addClass('field__item') }}>{{ item.content }}</div>
        {% endif %}
      {% endfor %}
      {% if multiple %}
    </div>
    {% endif %}
  </div>
{% endif %}
```


**Render breadcrumbs**

**Preprocess**
``` php
$block_manager = \Drupal::service('plugin.manager.block');
$plugin_block = $block_manager->createInstance('system_breadcrumb_block', []);
$variables['breadcrumbs'] = $plugin_block->build();
```

**Twig Tweak >= 8.x-2.x**
``` twig
{{ drupal_breadcrumb() }}
```

**Hide region render with debug comment.**
``` php
/**
 * Implements hook_preprocess() for disable debug in regions.
 */
function hook_preprocess(array &$variables, $hook) {
  /** @var \Twig_Environment $twig_service */
  $twig_service = \Drupal::service('twig');

  $is_debug = drupal_static(__FUNCTION__, $twig_service->isDebug());

  if ($is_debug) {
    if ($hook == 'region') {
      $twig_service->disableDebug();
    }
    else {
      $twig_service->enableDebug();
    }
  }
}

```

**Get url to Entity**
``` php
{{ path('entity.user.canonical', {'user': user.id}) }}
{{ path('entity.node.canonical', {'node': node.id}) }}
{{ path('entity.comment.canonical', {'comment': comment.id}, {'fragment': 'comment-' ~ comment.id}) }}
```

**Get link to Entity**
``` php
/**
 * Implements hook_preprocess_THEME().
 */
function hook_preprocess_media(&$variables) {
  $entity = $variables['node'];
  $variables['author_link'] = $entity->get('uid')->entity->toLink();
  $variables['author_url'] = $entity->toUrl()->toString(TRUE)->getGeneratedUrl();
}
```

**Get url to File**
``` twig
{{ file_url(elements['#media'].field_link.uri.value) }}
```

**Inline Template**
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

**Format date in Node Teaser (node--teaser.html.twig)**
``` twig
{% set date = node.createdtime|format_date('long') %}
```

**Format date in Node Teaser (field--node--created.html.twig)**
``` twig
{%- for item in element['#items'] -%}
  {{ item.value|format_date('long') }}
{%- endfor -%}
```

**Media logotype**
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
