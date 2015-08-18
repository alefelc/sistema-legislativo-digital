$ ->
  $('#declaracion-table').dataTable
    processing: true
    serverSide: true
    ajaxSource: $('#declaracion-table').data('source')
    pagingType: 'full_numbers'
