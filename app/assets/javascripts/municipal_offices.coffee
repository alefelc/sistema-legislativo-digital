global_namespace = exports ? this
MunicipalOffices = {}
global_namespace.MunicipalOffices = MunicipalOffices

MunicipalOffices.IndexDataTable = do ->
  init: ->
    $('#municipal-offices-table').dataTable
      processing: true
      serverSide: true
      lengthChange: true
      ajax:
        url: $('#municipal-offices-table').data('url')
        method: 'GET'
      columns: [
        { orderable: false  },
        { orderable: false, width: '6%' }
      ]
      initComplete: () ->
        $('#municipal-offices-table').on 'ajax:success', '.municipal-office-edit', (XHR, data, status) ->
          $('#municipal-office-edit').html(data)
          $('#municipal-office-edit .modal').modal 'show'

        $('#municipal-office-edit').on 'ajax:success', (XHR, data, status) ->
          $('#municipal-offices-table').dataTable().fnDraw()
          $('#municipal-office-edit .modal').modal 'hide'
