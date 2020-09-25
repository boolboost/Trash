**Formatted price.**

``` php
$raw = $price->toArray();

$price_format = $this->currencyFormatter->format($raw['number'], $raw['currency_code'], [
  'minimum_fraction_digits' => 0
]);
```
