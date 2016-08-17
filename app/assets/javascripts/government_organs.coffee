global_namespace = exports ? this
GovernmentOrgans = {}
global_namespace.GovernmentOrgans = GovernmentOrgans

GovernmentOrgans.IndexDataTable = do ->
  init: ->
    $('#government-organs-table').dataTable
      processing: true
      serverSide: true
      lengthChange: true
      ajax:
        url: $('#government-organs-table').data('url')
        method: 'GET'
      columns: [
        { orderable: false  },
        { orderable: false, width: '6%' }
      ]
      initComplete: () ->
        $('#government-organs-table').on 'ajax:success', '.government-organ-edit', (XHR, data, status) ->
          $('#government-organ-edit').html(data)
          $('#government-organ-edit .modal').modal 'show'

        $('#government-organ-edit').on 'ajax:success', (XHR, data, status) ->
          $('#government-organs-table').dataTable().fnDraw()
          $('#government-organ-edit .modal').modal 'hide'
