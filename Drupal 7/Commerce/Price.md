Rules для процентного изменения базовой цены всех товаров.

``` json
{
  "rules_price_percentage" : {
    "LABEL" : "Price Percentage",
    "PLUGIN" : "reaction rule",
    "OWNER" : "rules",
    "REQUIRES" : [ "rules", "commerce_line_item", "commerce_product_reference" ],
    "ON" : { "commerce_product_calculate_sell_price" : [] },
    "IF" : [
      { "data_is" : { "data" : [ "commerce-line-item:type" ], "value" : "product" } },
      { "data_is" : {
          "data" : [ "commerce-line-item:commerce-product:type" ],
          "value" : "product"
        }
      }
    ],
    "DO" : [
      { "commerce_line_item_unit_price_multiply" : {
          "commerce_line_item" : [ "commerce_line_item" ],
          "amount" : "1.00",
          "component_name" : "base_price",
          "round_mode" : "1"
        }
      }
    ]
  }
}
```
