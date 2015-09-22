#= require active_admin/base

$(document).ready ->
  $('#search_status_sidebar_section').hide()

  $('.usuario-resp').val($("#current_user").text())

  $(document).on 'click', '.button.has_many_add', ->
    console.log(this)
    $(this).prev().find(".boolean.input.optional").css("display", "none")
