~~~php
use Drupal\Component\Utility\SortArray;

uasort($array, function ($a, $b) {
   return SortArray::sortByKeyString($a, $b, 'key');
});
~~~
