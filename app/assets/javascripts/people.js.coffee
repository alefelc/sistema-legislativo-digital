global_namespace = exports ? this
People = {}
global_namespace.People = People

People.IndexDataTable = do ->
  init: ->
    $('#people-table').dataTable
      processing: true
      serverSide: true
      lengthChange: true
      language:
        processing: "<div></div><div></div><div></div><div></div><div></div>"
        emptyTable: "No se encontraron personas relacionadas a su búsqueda."
      ajax:
        url: $('#people-table').data('url')
        method: 'GET'
      columns: [
        { orderable: false },
        { orderable: false },
        { orderable: false },
        { orderable: false },
        { orderable: false },
        { orderable: false }
        { orderable: false },
      ]
