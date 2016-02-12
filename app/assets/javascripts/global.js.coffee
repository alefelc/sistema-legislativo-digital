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
    if e.ctrlKey || e.metaKey
      isCtrl = true
    if e.keyCode == key.charCodeAt(0) and isCtrl
      callback.apply this, args
      isCtrl = false
      return false
    isCtrl = false
    return
  ).keyup (e) ->
    if e.keyCode == 17
      isCtrl = false
    return
  return

$(document).keydown (event) ->
  if $('.datatable-keyevents').length
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

$(document).on 'focus', 'textarea', ->
  $(this).elastic()
  return

$(document).on 'focusout', 'textarea', ->
  $(this).animate({ height: "#{40}" }, 200)
  return

$(document).on 'ready', ->

  controller = window.location.pathname.split("/")[1]
  action = window.location.pathname.split("/")[2]
  if controller in ['despachos', 'comunicacion_oficials', 'proyectos', 'particulars', 'condonacions']
    $(document).find('.sidebar-menu .treeview:first').addClass('active')
    $(document).find('.sidebar-menu .treeview .treeview-menu:first').css('display', 'block')
    $(document).find('.sidebar-menu .treeview .treeview-menu:first').addClass('menu-open')

  if controller in ['reports']
    switch action
      when 'mesa_de_entradas'
        $(document).find('.sidebar-menu .treeview:first').addClass('active')
        $(document).find('.sidebar-menu .treeview .treeview-menu:first').css('display', 'block')
        $(document).find('.sidebar-menu .treeview .treeview-menu:first').addClass('menu-open')
      when 'expedientes'
        $(document).find('.sidebar-menu .treeview:eq(1)').addClass('active')
        $(document).find('.sidebar-menu .treeview .treeview-menu:eq(1)').css('display', 'block')
        $(document).find('.sidebar-menu .treeview .treeview-menu:eq(1)').addClass('menu-open')
      when 'normas'
        $(document).find('.sidebar-menu .treeview:eq(2)').addClass('active')
        $(document).find('.sidebar-menu .treeview .treeview-menu:eq(2)').css('display', 'block')
        $(document).find('.sidebar-menu .treeview .treeview-menu:eq(2)').addClass('menu-open')

  if controller in ['statitics']
    switch action
      when 'mesa_de_entradas'
        $(document).find('.sidebar-menu .treeview:first').addClass('active')
        $(document).find('.sidebar-menu .treeview .treeview-menu:first').css('display', 'block')
        $(document).find('.sidebar-menu .treeview .treeview-menu:first').addClass('menu-open')
      when 'expedientes'
        $(document).find('.sidebar-menu .treeview:eq(1)').addClass('active')
        $(document).find('.sidebar-menu .treeview .treeview-menu:eq(1)').css('display', 'block')
        $(document).find('.sidebar-menu .treeview .treeview-menu:eq(1)').addClass('menu-open')
      when 'normas'
        $(document).find('.sidebar-menu .treeview:eq(2)').addClass('active')
        $(document).find('.sidebar-menu .treeview .treeview-menu:eq(2)').css('display', 'block')
        $(document).find('.sidebar-menu .treeview .treeview-menu:eq(2)').addClass('menu-open')

  if controller in [ 'declaracions', 'decretos', 'especials', 'ordenanzas', 'otra_normas', 'resolucions' ]
    $(document).find('.sidebar-menu .treeview:eq(2)').addClass('active')
    $(document).find('.sidebar-menu .treeview .treeview-menu:eq(2)').css('display', 'block')
    $(document).find('.sidebar-menu .treeview .treeview-menu:eq(2)').addClass('menu-open')

  if controller in [ 'expedientes', 'pendientes' ]
    $(document).find('.sidebar-menu .treeview:eq(1)').addClass('active')
    $(document).find('.sidebar-menu .treeview .treeview-menu:eq(1)').css('display', 'block')
    $(document).find('.sidebar-menu .treeview .treeview-menu:eq(1)').addClass('menu-open')

  return
