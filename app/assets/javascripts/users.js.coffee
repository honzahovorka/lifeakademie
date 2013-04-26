$(document).ready ->
  $('form').find('#user_course_interest').change ->
    if $(this).val() != '0'
      $('.extra').fadeIn()
    else
      $('.extra').fadeOut()
