# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $('form').find('#user_course_interest').change ->
    if $(this).val() != '0'
      $('.extra').fadeIn()
    else
      $('.extra').fadeOut()
