$ ->
  $('#jacs').autocomplete({
    source: $('#jacs').data('fields')
  })
  $("#spinner").spin("small");