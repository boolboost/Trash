~~~
{% set zero_padding = '000'[:max(3-number|number_format(0)|length, 0)] %}

{{ zero_padding ~ number|number_format(2, '.', ' ') }} {{ currency.currencyCode }}
~~~
