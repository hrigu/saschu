# von hier abgeschaut: http://jsfiddle.net/eKFrW/
$ ->
  $('#user_role_parent').click( ->
    $('.student_part').hide()

  )
  $('#user_role_student').click( ->
    $('.student_part').show()
  )
