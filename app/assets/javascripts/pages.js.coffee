initPage = ->
  if $(".toggle-container").length
    $(".toggle-container").hide()
    $(".box-toggle").on "click", ".trigger", (e) ->
      self = $(e.target)
      self.toggleClass("active").next().stop(true, true).slideToggle "slow"
      e.preventDefault()

  $('.datepicker').datepicker()

  notifications = $('body').find($('.flash_notification'))
  if notifications.length > 0
    bar = $('<ul id="notifications-bar" class="container"></ul>')

    $.each notifications, (key, value) ->
      $(this).hide()

      bar.hide()
      notification = $('<li></li>')
      notification.addClass($(this).attr('class'))
      notification.removeClass('hidden').removeClass('flash_notification')
      notification.prependTo(bar)
      bar.show()
      bar.css({
        'top': "-#{(key+1)*41}px"
        'margin-bottom': "-#{(key+1)*41}px"
      })

      notification.html($(this).html())

      notification.click ->
        bar.animate({
          'height': "#{bar.height() - $(this).height() - 7}px"
        }, 'fast', 'linear', ->
          notification.remove()
        )


    bar.delay(500).animate({
      'top': "#{bar.height()}"
      'margin-bottom': 0
    }, 'fast')

    bar.prependTo($('body'))

externalLinks = ->
  # select all links to external sites and add them attribute rel="external"
  $("a[href*='http://']:not([href*='" + location.hostname + "']),[href*='https://']:not([href*='" + location.hostname + "'])")
    .attr("rel","external").attr("data-no-turbolink", "true")

  # open external links in new tab
  $('a[rel="external"]').click (e) ->
    e.preventDefault()
    window.open($(this).attr('href'))

$(document).ready ->
  initPage()
  externalLinks()
