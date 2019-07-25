**Setup**

```
1. Default service: "Local stock" (admin/commerce/config/stock/settings).
2. Create field "Stock level" (admin/commerce/config/product-variation-types/default/edit/fields/add-field).
3. Set widget "Simple stock transaction" (admin/commerce/config/product-variation-types/default/edit/form-display).
```

**Programmable field value setting**
``` php
// Current stock.
$entity->get('field_stock')->available_stock;

// Add stock.
$entity->set('field_stock', [
  'adjustment' => $add_stock,
]);

// Remove stock
$entity->set('field_stock', [
  'adjustment' => $remove_stock,
]);

// Fixed stock (current += stock - current).
$entity->set('field_stock', [
  'adjustment' => $stock - $entity->get('field_stock')->available_stock,
]);
```
