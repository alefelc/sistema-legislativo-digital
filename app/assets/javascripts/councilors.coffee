global_namespace = exports ? this
Councilors = {}
global_namespace.Councilors = Councilors

Councilors.IndexDataTable = do ->
  init: ->
    $('#councilors-table').dataTable
      processing: true
      serverSide: true
      lengthChange: true
      ajax:
        url: $('#councilors-table').data('url')
        method: 'GET'
      columns: [
        { orderable: false },
        { orderable: false },
        { orderable: false },
        { orderable: false,  width: '18%' },
      ]
      initComplete: () ->
        $('#councilors-table').on 'ajax:success', '.councilor-edit', (XHR, data, status) ->
          $('#councilor-edit').html(data)
          $('#councilor-edit .modal').modal 'show'

        $('#councilor-edit').on 'ajax:success', (XHR, data, status) ->
          $('#councilors-table').dataTable().fnDraw()
          $('#councilor-edit .modal').modal 'hide'
