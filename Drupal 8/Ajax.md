## Открытие страницы в диалоговом окне программно.
``` js
let url = `/comment/reply/${entity_type}/${entity}/${field_name}`;
let el = document.createElement('a');

let elementSettings = {
  progress: { type: 'throbber' },
  dialogType: 'modal',
  dialog: {
    width: 600,
    title: 'Добавить комментарий'
  },
  dialogRenderer: null,
  base: null,
  element: el
};
elementSettings.url = url;
elementSettings.event = 'click';

Drupal.ajax(elementSettings);
$(el).click();
```
