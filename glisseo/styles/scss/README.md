#Example

##OWL Carousel 1.x
~~~scss
.content {
  @include breakpoint($sm-media) {
    @include with-layout($susy-fixed-sm) {
      margin-left: -1*gutter()/2;
      margin-right: -1*gutter()/2;
    }
  }
  
  @include breakpoint($md-media) {
    @include with-layout($susy-fixed-md) {
      margin-left: -1*gutter()/2;
      margin-right: -1*gutter()/2;
    }
  }
  
  @include breakpoint($lg-media) {
    @include with-layout($susy-fixed-lg) {
      margin-left: -1*gutter()/2;
      margin-right: -1*gutter()/2;
    }
  }
	
  .owl-item {
  	@include breakpoint($sm-media) {
      @include with-layout($susy-fixed-sm) {
        padding-left: gutter()/2;
        padding-right: gutter()/2;
      }
  	}
  	
  	@include breakpoint($md-media) {
      @include with-layout($susy-fixed-md) {
        padding-left: gutter()/2;
        padding-right: gutter()/2;
      }
  	}
  	
  	@include breakpoint($lg-media) {
      @include with-layout($susy-fixed-lg) {
        padding-left: gutter()/2;
        padding-right: gutter()/2;
      }
  	}
  }
}
~~~
