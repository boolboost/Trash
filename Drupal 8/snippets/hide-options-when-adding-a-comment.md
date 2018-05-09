~~~php
/**
 * hook_form_FORM_ID_alter().
 * @form_id
 * comment_product_form
 */
function hook_form_comment_product_form_alter(&$form, FormStateInterface $form_state, $form_id) {
  $form['actions']['submit']['#value'] = t('Submit Comment');

  $form['comment_body']['widget']['#after_build'][] = '_hook_comment_after_build';
}

function _hook_comment_after_build($form_element, FormStateInterface $form_state) {
  if (isset($form_element[0]['format'])) {
    unset($form_element[0]['format']['guidelines']);
    unset($form_element[0]['format']['help']);
    unset($form_element[0]['format']['#type']);
    unset($form_element[0]['format']['#theme_wrappers']);
    $form_element[0]['format']['format']['#access'] = FALSE;
  }

  return $form_element;
}
~~~
