# $(document).on 'ready page:load', ->
#   clean_form = () ->
#     $('#reportrange span').text('Seleccione fecha')
#     $('#tramites_type option:selected').each () ->
#       $(this).prop 'selected', false
#     $('#tramites_type').multiselect 'refresh'
#     $('#filter-values').val '{}'

#   $('#tramites_type').multiselect
#     buttonText: (options, select) ->
#         if options.length == 0
#           return 'Seleccione algún trámite ...'
#         else if (options.length > 3)
#           return 'Mas de 3 tipos de trámites ...'
#         else
#           labels = []
#           options.each () ->
#             if $(this).attr('label') != undefined
#               labels.push $(this).attr('label')
#             else
#               labels.push $(this).html()
#           return labels.join(', ') + ''
#       onChange: (a, b, c) ->
#         data = $.parseJSON $('#filter-values').val()
#         data.types = $('#tramites_type option:selected').map((idx, elem) ->
#           $(elem).val()).toArray().toString()
#         $('#filter-values').val(JSON.stringify data)

#   $('#filter-submit').on 'click', ->
#     $('#tramite-table').DataTable().draw()

#   $('#filter-clean').on 'click', ->
#     clean_form()
#     $('#tramite-table').DataTable().draw()

#   do ->
#     $('#reportrange').daterangepicker
#       locale:
#         format: "DD/MM/YYYY"
#         separator: " - "
#         applyLabel: "Aceptar"
#         cancelLabel: "Cancelar"
#         fromLabel: "Desde"
#         toLabel: "Hasta"
#         todayLabel: "Hoy"
#         customRangeLabel: "Rango personalizado"
#         weekLabel: "S"
#         daysOfWeek: ["Do", "Lu", "Ma", "Mi", "Ju", "Vi", "Sa"],
#         monthNames: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
#           "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"
#         ]
#       ranges:
#         'Hoy': [moment(), moment()]
#         'Ayer': [moment().subtract(1, 'days'), moment().subtract(1, 'days')]
#         'Últimos 7 Dias': [moment().subtract(6, 'days'), moment()]
#         'Últimos 30 Dias': [moment().subtract(29, 'days'), moment()]
#         'Este Mes': [moment().startOf('month'), moment().endOf('month')]
#         'Mes Anterior': [moment().subtract(1, 'month').startOf('month'),
#           moment().subtract(1, 'month').endOf('month')]

#     $('#reportrange span').text 'Seleccione fecha'

#     $('#reportrange').on 'apply.daterangepicker', (ev, picker) ->
#       from = picker.startDate.format('DD/MM/YYYY')
#       to = picker.endDate.format('DD/MM/YYYY')
#       data = $.parseJSON($('#filter-values').val())
#       data.created_at = { from: from, to: to }
#       $('#filter-values').val(JSON.stringify data)
#       $('#reportrange span').text "#{from} - #{to}"

#     $('#reportrange').on 'cancel.daterangepicker', (ev, picker) ->
#       clean_form()
#       $('#reportrange span').text('Seleccione fecha')
