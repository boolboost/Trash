``` js
var $carousel = $('.fotorama');
$carousel.removeAttr('data-autoplay');

var $progressBar = $('<div class="fotorama__stage__progress_bar"/>');

var percentTime;
var tick;
var time = 1;

$carousel.on('fotorama:ready', function (e, fotorama) {
  var $stage = $('.fotorama__stage', $carousel);
  $stage.prepend($progressBar);
});

$carousel.on('fotorama:show', function (e, fotorama, extra) {
  time = extra.time * 0.001;
  startProgressbar();
});

function startProgressbar() {
  resetProgressbar();
  percentTime = 0;
  tick = setInterval(interval, 10);
}

function interval() {
  percentTime += 1 / (time + 5);

  $progressBar.css({
    width: percentTime + "%"
  });

  if (percentTime >= 100) {
    $carousel.data('fotorama').show('>');
    startProgressbar();
  }
}

function resetProgressbar() {
  $progressBar.css({
    width: '0%'
  });
  clearInterval(tick);
}
```
