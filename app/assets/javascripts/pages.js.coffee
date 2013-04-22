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
  $('#accordion').accordion()

