$(document).on 'ready page:load', ->

  $('#tramites_type').multiselect
    buttonText: (options, select) ->
        if options.length == 0
          return 'Seleccione algún trámite ...'
        else if (options.length > 3)
          return 'Mas de 3 tipos de trámites ...'
        else
          labels = []
          options.each () ->
            if $(this).attr('label') != undefined
              labels.push $(this).attr('label')
            else
              labels.push $(this).html()
          return labels.join(', ') + ''
      onInitialized: (select, container) ->
          $('#tramites_type')

  $('#filter-submit').on 'click', ->
    alert('click')
