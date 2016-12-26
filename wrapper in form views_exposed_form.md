Variable "content" with full form.

~~~php
/**
 * Implements theme_preprocess_views_exposed_form().
 */
function theme_preprocess_views_exposed_form(&$variables) {
  $variables['content'] = '';
  foreach ($variables['widgets'] as $key => $widget) {
    if (isset($widget->widget)) {
      $field_name = preg_replace('/^edit-/', '', $widget->id);
      $field_name = preg_replace('/\-/', '_', $field_name);
      $variables['content'] .= render($variables['form'][$field_name]);
    }
  }

  $variables['content'] .= $variables['button'];
}
~~~

Add field label and fixed structure.
~~~php
/**
 * Implements hook_form_FORM_ID_alter().
 *
 * @form_id
 * views_exposed_form
 */
function hook_form_views_exposed_form_alter(&$form, &$form_state, $form_id) {
  // fixed structure elements
  $filter = function (&$item, $key, $data) {
    if ($key{0} != '#' && is_array($item)) {
      $info = &$data['info'];
      $callback = &$data['callback'];

      // base key
      $info_key = 'filter-' . $key;

      // key taxonomy term
      if (!isset($info[$info_key]) && isset($info[$info_key . '_tid'])) {
        $info_key = $info_key . '_tid';
      }

      // base label
      if (isset($info[$info_key])) {
        $title = $info[$info_key]['label'];

        if (isset($item['#tree']) && $item['#tree']) {
          $item['value']['#title'] = $title;
        }
        else {
          $item['#title'] = $title;
        }
      }

      // range
      if (!isset($item['#type']) && isset($item['min'], $item['max'])) {
        $id = drupal_html_id('edit-' . $info[$info_key]['value'] . '-wrapper');
        $classes = drupal_html_class('views-exposed-widget views-widget-filter-' . $key);

        // markup
        $prefix = format_string('<div id="@id" class="@classes">', array(
          '@id' => $id,
          '@classes' => $classes,
        ));

        // label
        if ($item['value']['#title']) {
          $prefix .= format_string('<label for="@for">!label</label>', array(
            '@for' => $id,
            '!label' => $item['value']['#title'],
          ));
        }

        // content
        $prefix .= '<div class="views-widget">';

        $item['#prefix'] = $prefix;
        $item['#suffix'] = '</div></div>';
      }

      // submit
      if ($key == 'submit') {
        $item['#prefix'] = '<div class="views-exposed-widget views-submit-button">';
        $item['#suffix'] = '</div>';
      }

      array_walk($item, $callback, $data);
    }
  };

  array_walk($form, $filter, array(
    'info' => &$form['#info'],
    'callback' => $filter,
  ));
}
~~~

Template "views-exposed-form.tpl.php".
~~~php
<?php
/**
 * @file
 * This template handles the layout of the views exposed filter form.
 *
 * Variables available:
 * - $widgets: An array of exposed form widgets. Each widget contains:
 * - $widget->label: The visible label to print. May be optional.
 * - $widget->operator: The operator for the widget. May be optional.
 * - $widget->widget: The widget itself.
 * - $button: The submit button for the form or last item form.
 * - $content: full form
 *
 * @ingroup views_templates
 */
?>
<?php if (!empty($q)): ?>
  <?php
  // This ensures that, if clean URLs are off, the 'q' is added first so that
  // it shows up first in the URL.
  print $q;
  ?>
<?php endif; ?>
<div class="views-exposed-form">
  <div class="views-exposed-widgets clearfix">
    <?php print $content; ?>
  </div>
</div>
~~~
