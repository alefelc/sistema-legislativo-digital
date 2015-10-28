##val = $(window).height()-280

$.extend $.fn.dataTable.defaults,
  pagingType: 'full_numbers'
  ##'scrollCollapse': true
  ##'scrollY': val
  lengthChange: false
  pageLength: 10
  bServerSide: true
  processing: true
  language:
    "sProcessing":     "Procesando..."
    "sLengthMenu":     "Mostrar _MENU_ registros"
    "sZeroRecords":    "No se encontraron resultados"
    "sEmptyTable":     "Ningún dato disponible en esta tabla"
    "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros"
    "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros"
    "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)"
    "sInfoPostFix":    ""
    "sSearch":         "Buscar:"
    "sUrl":            ""
    "sInfoThousands":  ","
    "sLoadingRecords": "Cargando..."
    "oPaginate":
      "sFirst":    "Primero"
      "sLast":     "Último"
      "sNext":     "Siguiente"
      "sPrevious": "Anterior"
    "oAria":
      "sSortAscending":  ": Activar para ordenar la columna de manera ascendente"
      "sSortDescending": ": Activar para ordenar la columna de manera descendente"

$.ctrl = (key, callback, args) ->
  isCtrl = false
  $(document).keydown((e) ->
    if !args
      args = []
    # IE barks when args is null
    if e.ctrlKey
      isCtrl = true
    if e.keyCode == key.charCodeAt(0) and isCtrl
      callback.apply this, args
      return false
    return
  ).keyup (e) ->
    if e.ctrlKey
      isCtrl = false
    return
  return

$(document).keydown (event) ->
  table = $('.datatable-keyevents').dataTable()
  currentRow = $('.datatable-keyevents tbody tr.info').get(0)
  switch event.keyCode
    ## arrow down
    when 40
      if $(currentRow).next().length != 0
        $(currentRow).next().addClass 'info'
        $(currentRow).removeClass 'info'
    ## arrow up
    when 38
      if $(currentRow).prev().length != 0
        $(currentRow).prev().addClass 'info'
        $(currentRow).removeClass 'info'
    ## arrow left
    when 37
      table.fnPageChange('previous')
    ## arrow right
    when 39
      table.fnPageChange('next')
    when 13
      $('tr.info').find('td:eq(0) a').get(0).click()
  ## Update scrollbar
  rowpos = $('tr.info').position()
  $(document).scrollTop(rowpos.top-45)
  return

$(document).on 'click', '.remove-table-row', ->
  $(this).parents('tr').remove()
  return

$(document).on 'ready page:load', ->
  controller = window.location.pathname.split("/")[1]
  if controller in ['despachos', 'comunicaciones_oficiales', 'proyectos', 'particulares', 'condonaciones']
    $(document).find('.sidebar-menu .treeview:first').addClass('active')
    $(document).find('.sidebar-menu .treeview .treeview-menu:first').css('display', 'block')
    $(document).find('.sidebar-menu .treeview .treeview-menu:first').addClass('menu-open')
    return
  if controller in [ 'declaracions', 'decretos', 'especials', 'ordenanzas', 'otra_normas', 'resolucions' ]
    $(document).find('.sidebar-menu .treeview:eq(1)').addClass('active')
    $(document).find('.sidebar-menu .treeview .treeview-menu:eq(1)').css('display', 'block')
    $(document).find('.sidebar-menu .treeview .treeview-menu:eq(1)').addClass('menu-open')
    return
