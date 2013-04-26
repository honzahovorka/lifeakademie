# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
$ ->
  if $(".toggle-container").length
    $(".toggle-container").hide()
    $(".box-toggle").on "click", ".trigger", (e) ->
      self = $(e.target)
      self.toggleClass("active").next().stop(true, true).slideToggle "slow"
      #    $.fn.autoload();
      e.preventDefault()

$ ->
  $('.datepicker').datepicker()

$(document).ready ->
  notifications = $('body').find($('.flash_notification'))
  if notifications.length > 0
    bar = $("<ul id=\"notifications-bar\" class=\"container\"></ul>")

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
          'height': "#{bar.height() - $(this).height() - 1}px"
        }, 'fast', 'linear', ->
          notification.remove()
        )


    bar.delay(400).animate({
      'top': "#{bar.height()}"
      'margin-bottom': 0
    }, 'fast')

    bar.prependTo($('body'))
