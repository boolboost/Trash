

Gulp - gulpfile.js (https://www.npmjs.com/package/gulp-livereload).
```
livereload.listen({port: 35730});
```

Brower console (https://chrome.google.com/webstore/detail/remotelivereload/jlppknnillhjgiengoigajegdpieppei).
```
LiveReload.connector._onclose();
LiveReload.connector._uri = "ws://" + location.host + ":35730/livereload";
LiveReload.connector._onopen();
```
