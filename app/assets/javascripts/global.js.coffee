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
    "sSearch":         ""
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
    "searchPlaceholder": "¿Qué desea buscar?"

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
    switch controller
      when 'despachos'
        $('a[href="/despachos"]').css('color', 'white')
      when 'comunicacion_oficials'
        $('a[href="/comunicacion_oficials"]').css('color', 'white')
      when 'proyectos'
        $('a[href="/proyectos"]').css('color', 'white')
      when 'particulars'
        $('a[href="/particulars"]').css('color', 'white')
      when 'condonacions'
        $('a[href="/condonacions"]').css('color', 'white')

  if controller in ['reports']
    switch action
      when 'mesa_de_entradas'
        $(document).find('.sidebar-menu .treeview:first').addClass('active')
        $(document).find('.sidebar-menu .treeview .treeview-menu:first').css('display', 'block')
        $(document).find('.sidebar-menu .treeview .treeview-menu:first').addClass('menu-open')
        $('a[href="/reports/mesa_de_entradas"]').css('color', 'white')
      when 'expedientes'
        $(document).find('.sidebar-menu .treeview:eq(1)').addClass('active')
        $(document).find('.sidebar-menu .treeview .treeview-menu:eq(1)').css('display', 'block')
        $(document).find('.sidebar-menu .treeview .treeview-menu:eq(1)').addClass('menu-open')
        $('a[href="/reports/expedientes"]').css('color', 'white')
      when 'normas'
        $(document).find('.sidebar-menu .treeview:eq(2)').addClass('active')
        $(document).find('.sidebar-menu .treeview .treeview-menu:eq(2)').css('display', 'block')
        $(document).find('.sidebar-menu .treeview .treeview-menu:eq(2)').addClass('menu-open')
        $('a[href="/reports/normas"]').css('color', 'white')

  if controller in ['statitics']
    switch action
      when 'mesa_de_entradas'
        $(document).find('.sidebar-menu .treeview:first').addClass('active')
        $(document).find('.sidebar-menu .treeview .treeview-menu:first').css('display', 'block')
        $(document).find('.sidebar-menu .treeview .treeview-menu:first').addClass('menu-open')
        $('a[href="/statitics/mesa_de_entradas"]').css('color', 'white')
      when 'expedientes'
        $(document).find('.sidebar-menu .treeview:eq(1)').addClass('active')
        $(document).find('.sidebar-menu .treeview .treeview-menu:eq(1)').css('display', 'block')
        $(document).find('.sidebar-menu .treeview .treeview-menu:eq(1)').addClass('menu-open')
        $('a[href="/statitics/expedientes"]').css('color', 'white')
      when 'normas'
        $(document).find('.sidebar-menu .treeview:eq(2)').addClass('active')
        $(document).find('.sidebar-menu .treeview .treeview-menu:eq(2)').css('display', 'block')
        $(document).find('.sidebar-menu .treeview .treeview-menu:eq(2)').addClass('menu-open')
        $('a[href="/statitics/normas"]').css('color', 'white')

  if controller in [ 'declaracions', 'decretos', 'especials', 'ordenanzas', 'otra_normas', 'resolucions' ]
    $(document).find('.sidebar-menu .treeview:eq(2)').addClass('active')
    $(document).find('.sidebar-menu .treeview .treeview-menu:eq(2)').css('display', 'block')
    $(document).find('.sidebar-menu .treeview .treeview-menu:eq(2)').addClass('menu-open')
    switch controller
      when 'declaracions'
        $('a[href="/declaracions"]').css('color', 'white')
      when 'decretos'
        $('a[href="/decretos"]').css('color', 'white')
      when 'especials'
        $('a[href="/especials"]').css('color', 'white')
      when 'ordenanzas'
        $('a[href="/ordenanzas"]').css('color', 'white')
      when 'otra_normas'
        $('a[href="/otra_normas"]').css('color', 'white')
      when 'resolucions'
        $('a[href="/resolucions"]').css('color', 'white')

  if controller in [ 'expedientes', 'pendientes' ]
    $(document).find('.sidebar-menu .treeview:eq(1)').addClass('active')
    $(document).find('.sidebar-menu .treeview .treeview-menu:eq(1)').css('display', 'block')
    $(document).find('.sidebar-menu .treeview .treeview-menu:eq(1)').addClass('menu-open')
    switch controller
      when 'expedientes'
        $('a[href="/expedientes"]').css('color', 'white')
      when 'pendientes'
        $('a[href="/pendientes"]').css('color', 'white')

  if controller in [ 'persons', 'government_offices', 'municipal_offices', 'concilors' ]
    $(document).find('.sidebar-menu .treeview:eq(3)').addClass('active')
    $(document).find('.sidebar-menu .treeview .treeview-menu:eq(3)').css('display', 'block')
    $(document).find('.sidebar-menu .treeview .treeview-menu:eq(3)').addClass('menu-open')
    switch controller
      when 'persons'
        $('a[href="/persons"]').css('color', 'white')
      when 'government_offices'
        $('a[href="/government_offices"]').css('color', 'white')
      when 'government_offices'
        $('a[href="/municipal_offices"]').css('color', 'white')
      when 'concilors'
        $('a[href="/concilors"]').css('color', 'white')
  return
