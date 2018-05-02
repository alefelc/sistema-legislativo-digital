## Global javascript settings
$('document').ready ->
  $('.tooltip-text').tooltip()

  $('.dataTable.table-hover').on 'click', '.current-tr', () ->
    id = $(this).find('.current-url').data 'url'
    if id == null || id == undefined
      return
    location.assign id

## Select2 default settings
$.fn.select2.defaults.set 'theme', 'bootstrap'

$.extend $.fn.dataTable.defaults,
  language:
    "sPaginationType": "bootstrap"
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
  createdRow: (row, data, index) ->
    $(row).addClass('current-tr');

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

$ ->
  if $('.icheck-me').length > 0
    $('.icheck-me').each ->
      $el = $(this)
      skin = if $el.attr('data-skin') != undefined then '_' + $el.attr('data-skin') else ''
      color = if $el.attr('data-color') != undefined then '-' + $el.attr('data-color') else ''
      opt =
        checkboxClass: 'icheckbox' + skin + color
        radioClass: 'iradio' + skin + color
      $el.iCheck opt
      return
  return

#$.fn.select2.amd.require ['select2/selection/search'], (Search) ->
#    oldRemoveChoice = Search.prototype.searchRemoveChoice
#    Search.prototype.searchRemoveChoice = () ->
#        oldRemoveChoice.apply this, arguments
#        this.$search.val ''
