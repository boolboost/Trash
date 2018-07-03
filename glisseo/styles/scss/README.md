## Footer bottom

~~~scss
body {
  min-height: 100vh;
}

body,
[data-off-canvas-main-canvas],
.app {
  display: flex;
  flex-direction: column;
}

[data-off-canvas-main-canvas],
.app,
.app__content {
  flex-grow: 1;
}
~~~
