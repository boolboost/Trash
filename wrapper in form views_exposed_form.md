Variable "content" with full form.

~~~php
/**
 * Implements theme_preprocess_views_exposed_form().
 */
function theme_preprocess_views_exposed_form(&$variables) {
  $variables['content'] = '';
  foreach ($variables['widgets'] as $key => $widget) {
    if (isset($widget->widget)) {
      $field_name = preg_replace('/^filter-/', '', $key);
      $variables['content'] .= render($variables['form'][$field_name]);
    }
  }

  $variables['content'] .= $variables['button'];
}
~~~

Add field label.
~~~php
/**
 * Implements hook_form_FORM_ID_alter().
 *
 * @form_id
 * views_exposed_form
 */
function crm_theme_form_views_exposed_form_alter(&$form, &$form_state, $form_id) {
  // fixed label
  $filter = function (&$item, $key, $data) {
    if ($key{0} != '#' && is_array($item)) {
      $info = &$data['info'];
      $callback = &$data['callback'];

      if (isset($info['filter-' . $key])) {
        $title = $info['filter-' . $key]['label'];

        if (isset($item['#tree']) && $item['#tree']) {
          $item['value']['#title'] = $title;
        }
        else {
          $item['#title'] = $title;
        }
      }

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
