$(document).on 'ready page:load', ->
  $('#declaracion-table').dataTable
    processing: true
    serverSide: true
    ajaxSource: $('#declaracion-table').data('source')
    pagingType: 'full_numbers'
    displayLength: 10
    bLengthChange: false