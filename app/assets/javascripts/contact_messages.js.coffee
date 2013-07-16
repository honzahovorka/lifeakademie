$ ->
  $('.contact .spam_protection').hide()
  $('.contact input[type="submit"]').click ->
    $('.contact input.spam_protection').attr('value', '2')
    if ! $('.contact input#surname').empty?
      return false
