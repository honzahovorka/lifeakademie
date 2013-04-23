jQuery(document).ready(function($) {
  var extend = {
    button: '#back-top',
    backToTop: '.divider-top a',
    text: 'Nahoru',
    min: 200,
    fadeIn: 400,
    fadeOut: 400,
    speed: 800,
    easing: 'easeOutQuint'
  };

  $('body').append('<a href="#" id="' + extend.button.substring(1) + '" title="' + extend.text + '">' + extend.text + '</a>');

  $(window).scroll(function() {
    var pos = $(window).scrollTop();

    if (pos > extend.min) {
      $(extend.button).fadeIn(extend.fadeIn);
    }
    else {
      $(extend.button).fadeOut(extend.fadeOut);
    }

  });

  $(extend.button).add(extend.backToTop).click(function(e) {
    $('html, body').animate({
      scrollTop: 0
    }, extend.speed, extend.easing);
    e.preventDefault();
  });
});
