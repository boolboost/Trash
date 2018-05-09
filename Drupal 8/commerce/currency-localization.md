# Currency localization

File `commerce-price-plain.html.twig`.

~~~php
{#
/**
 * @file
 * Default theme implementation for displaying a price.
 *
 * Used by the 'commerce_price_plain' formatter.
 * Available variables:
 * - number: The number.
 * - currency: The currency entity.
 *
 * @ingroup themeable
 */
#}
{{ number|number_format(2, ',', ' ') }} {{ currency.currencyCode|trans }}
~~~