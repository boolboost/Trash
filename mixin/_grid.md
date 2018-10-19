## Lost waffle gutter vertical
~~~ scss
@mixin lost-waffle-gutter-vertical($column, $gutter) {
  &:nth-child(1n) {
    margin-bottom: $gutter;
  }

  &:nth-last-child(-n + #{$column}) {
    margin-bottom: 0;
  }
}
~~~

## Custom
~~~ scss
@mixin grid($col, $gap: 16px) {
  display: flex;
  flex-wrap: wrap;

  > * {
    margin-top: $gap;

    @if $col>1 {
      width: calc((100% - #{$gap*($col - 1)})/#{$col});
      margin-right: $gap;

      &:nth-child(#{$col}n) {
        margin-right: 0;
      }
    } @else {
      width: 100%;
    }

    @if $col>1 {
      &:nth-child(-n+#{$col}) {
        margin-top: 0;
      }
    } @else {
      &:first-child {
        margin-top: 0;
      }
    }
  }
}
~~~
