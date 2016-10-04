class Procedures {
  static indexDataTable() {
    $('#procedures-table').dataTable({
      processing: true,
      serverSide: true,
      // columns: [
      //   { name: 'attendance_type', orderable: true, searchable: false }
      //   { name: 'title', orderable: true, searchable: false }
      //   { name: 'abbreviation', orderable: true, searchable: false }
      //   { name: 'status', orderable: true, searchable: false }
      //   { name: 'default', orderable: true, searchable: false }
      // ]
      ajax: {
        url: $('#procedures-table').data('url'),
        method: 'GET',
        dataType: 'json'
        // Needed for the filters
        // data: function(params) {
        //   params.status_filter = $('select.status-filter').val()
        //   return params
      }
    })
  }
  static procedureInitiators() {
    //$('')
  }
}

$(document).on('ready', () => {

})
