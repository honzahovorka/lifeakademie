$(document).on 'page:change', ->
  $('form').find('#user_course_interest').change ->
    if $(this).val().length > 0
      $('.extra').fadeIn()
    else
      $('.extra').fadeOut()
