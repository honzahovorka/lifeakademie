/* ---------------------------------------------------- */
/* Main Navigation
/* ---------------------------------------------------- */

jQuery(document).ready(function($) {

  (function() {

      var arrowimages = {
          down: 'downarrowclass',
          right: 'rightarrowclass'
      };
      var $mainNav = $('#navigation').find('ul'),
              optionsList = '<option value="" selected>Navigace</option>';

      var $submenu = $mainNav.find("ul").parent();
      $submenu.each(function(i) {
          var $curobj = $(this);
          this.istopheader = $curobj.parents("ul").length == 1 ? true : false;
          $curobj.children("a").append('<span class="' + (this.istopheader ? arrowimages.down : arrowimages.right) + '"></span>');
      });

      $mainNav.on('mouseenter', 'li', function() {
          var $this = $(this),
                  $subMenu = $this.children('ul');
          if ($subMenu.length)
              $this.addClass('hover');
          $subMenu.hide().stop(true, true).fadeIn(200);
      }).on('mouseleave', 'li', function() {
          $(this).removeClass('hover').children('ul').stop(true, true).fadeOut(50);
      });

      // Navigation Responsive

      $mainNav.find('li').each(function() {
          var $this = $(this),
                  $anchor = $this.children('a'),
                  depth = $this.parents('ul').length - 1,
                  dash = '';

          if (depth) {
              while (depth > 0) {
                  dash += '--';
                  depth--;
              }
          }

          optionsList += '<option value="' + $anchor.attr('href') + '">' + dash + ' ' + $anchor.text() + '</option>';

      }).end()
        .after('<select class="nav-responsive">' + optionsList + '</select>');

        $('.nav-responsive').on('change', function() {
            window.location = $(this).val();
        });
  })();
});
