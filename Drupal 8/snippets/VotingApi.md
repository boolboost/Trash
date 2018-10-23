## Ratings with author
``` php
$rating = 0;

$query = \Drupal::database()->select('node_field_data', 'n');
$query->fields('n', ['nid']);
$query->condition('status', TRUE);
$query->condition('type', 'article');
$query->condition('uid', $uid);
$ids = $query->execute()->fetchAllKeyed(0, 0);

if ($ids) {
  $query = \Drupal::database()->select('votingapi_result', 'v');
  $query->fields('v', ['type', 'function', 'value']);
  $query->condition('v.function', 'vote_sum');
  $query->condition('v.entity_type', 'node');
  $query->condition('v.entity_id', $ids, 'IN');
  
  $result = $query->execute();
  
  while ($row = $result->fetchAssoc()) {
    $rating += $row['value'];
  }
}

$variables['rating'] = $rating;
```
