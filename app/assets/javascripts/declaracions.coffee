jQuery ->
  $('#declaracion-table').DataTable
    processing: true
    serverSide: true
    ajax: $('#declaracion-table').data('source')
    pagingType: 'full_numbers'
    columns: [
      { data: '0' }
      { data: '1' }
      { data: '2' }
    ]
    bJQueryUI: true
