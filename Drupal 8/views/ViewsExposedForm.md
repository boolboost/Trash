**Set default taxonomy term in form action for views `taxonomy/term/%/path`**
``` php
use Drupal\Core\Form\FormStateInterface;

/**
 * Implements hook_form_FORM_ID_alter() for views_exposed_form.
 */
function hook_form_views_exposed_form_alter(&$form, FormStateInterface $form_state, $form_id) {
  $storage_view = $form_state->getStorage('view');
  /** @var \Drupal\views\ViewExecutable $view */
  $view = &$storage_view['view'];

  if ($view->id() == 'search_events' && $view->current_display == 'page_1') {
    if ($form['#action'] == '/taxonomy/term/all/path') {
      $tid = NULL;
      $parameters = \Drupal::routeMatch()->getParameters();
      $term = $parameters->get('taxonomy_term');

      if ($term instanceof TermInterface) {
        // Page term.
        $tid = $term->id();
      } else {
        // Page views.
        $view_id = $parameters->get('view_id');
        $display_id = $parameters->get('display_id');

        if ($view_id == 'search_events' && $display_id == 'page_1') {
          $tid = $parameters->get('arg_0');
        }
      }

      if ($tid) {
        $alias = \Drupal::service('path.alias_manager')->getAliasByPath('/taxonomy/term/' . $tid . '/path');
        $form['#action'] = $alias;
      }
    }
  }
}
```
