global_namespace = exports ? this
GovernmentOffices = {}
global_namespace.GovernmentOffices = GovernmentOffices

GovernmentOffices.IndexDataTable = do ->
  init: ->
    $('#government-offices-table').dataTable
      processing: true
      serverSide: true
      lengthChange: true
      ajax:
        url: $('#government-offices-table').data('url')
        method: 'GET'
      columns: [
        { orderable: false  },
        { orderable: false, width: '6%' }
      ]
      initComplete: () ->
        $('#government-offices-table').on 'ajax:success', '.gov-office-edit', (XHR, data, status) ->
          $('#gov-office-edit').html(data)
          $('#gov-office-edit .modal').modal 'show'

        $('#gov-office-edit').on 'ajax:success', (XHR, data, status) ->
          $('#government-offices-table').dataTable().fnDraw()
          $('#gov-office-edit .modal').modal 'hide'
