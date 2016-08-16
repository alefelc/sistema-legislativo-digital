global_namespace = exports ? this
People = {}
global_namespace.People = People

People.IndexDataTable = do ->
  init: ->
    $('#people-table').dataTable
      processing: true
      serverSide: true
      lengthChange: true
      ajax:
        url: $('#people-table').data('url')
        method: 'GET'
      columns: [
        { orderable: false  },
        { orderable: false },
        { orderable: false  },
        { orderable: false },
        { orderable: false },
        { orderable: false },
        { orderable: false },
        { orderable: false }
      ]
      initComplete: () ->
        $('#people-table').on 'ajax:success', '.person-edit', (XHR, data, status) ->
          $('#person-edit').html(data)
          $('#person-edit .modal').modal 'show'

        $('#person-edit').on 'ajax:success', (XHR, data, status) ->
          $('#people-table').dataTable().fnDraw()
          $('#edit-person.modal').modal 'hide'
