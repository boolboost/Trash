#Example

Render button.
~~~php
$link = entityform_ctools_add_link('Open', 'entityform_name', 'entityform-class',
  array(
    'attributes' => array(
      'class' => 'button',
    )
  ));
~~~

Setting ctools dialog.
~~~php
/**
 * Implements hook_preprocess_page().
 */
function function hook_preprocess_page() {
  $style = array(
    'entityform-class' => array(
      'modalSize' => array(
        // fixed or scale
        'type' => 'fixed',
        // Npx or 0-1 as percentage, where 0.1 - 10%
        'width' => '320px',
        // Npx or 0-1 as percentage.
        'height' => 'auto',
        'addWidth' => '0',
        'addHeight' => '0',
        'contentRight' => '25',
        'contentBottom' => '0',
      ),
      'modalTheme' => 'entityform_ctools_modal',
      'throbberTheme' => 'entityform_ctools_throbber',
      'modalClass' => 'entityform-class',
      // This is css array will apply automatically.
      'modalOptions' => array(),
      // show, fadeIn or slideDown
      'animation' => 'show',
      // slow, medium or fast
      'animationSpeed' => 'fast',
      'closeText' => '❌',
      'closeImage' => '',
      // @TODO translate
      'loadingText' => 'Секундочку, форма загружается…',
      'throbber' => theme('image', array(
        'path' => ctools_image_path('throbber.gif', 'entityform_ctools'),
        'alt' => t('Loading...'),
        'title' => t('Loading')
      )),
    ),
  );
  
  drupal_add_js($style, 'setting');
}
~~~

Style ctools dialog.
~~~sass
#modalContent.modal-entityform-class {
  @include breakpoint($xs-media) {
    max-width: 100%;
    padding: 20px;
  }
  
  .modal-header {
    padding: 10px;
    border-radius: 3px 3px 0 0;
    background: #2196F3;
    color: #fff;
    
    .close {
      float: right;
      color: inherit;
      -webkit-filter: brightness(1000%);
    }
  }
  
  .modal-content {
    padding: 10px;
    background: #fff;
    border-radius: 0 0 3px 3px;
  }
}
~~~

Fix Automatic alignment.
~~~js
Drupal.behaviors.ctools_dialog_automatic_alignment = {
  attach: function (context, settings) {
    $(window).resize();
  }
};
~~~
