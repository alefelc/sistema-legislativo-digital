module ProceduresHelper
  ## Missing implementation here!
  ## Dinamically derivate a procedure to its respective area
  def derivated_areas()
    options_for_select [
      ['Dirección Legislativa', 'legislative_area']
    ]
  end

  def procedure_types(procedure=nil)
    types = []
    if procedure.present?
      types += %w(Condonacion Peticion)
      types += %w(Proyecto ComunicacionOficial OtrosIngresos)
    else
      types += %w(Despacho Condonacion Peticion)
      types += %w(Proyecto ComunicacionOficial OtrosIngresos)
    end
    result = [[]]
    types.each do |t|
      result << [I18n.t("procedures.types.#{t}"), t]
    end
    options_for_select result, procedure
  end

  def filter_by_derivated(param={})
    ##########################
    ## Missing constants HERE!!
    ##########################
    if param.present? && param[:default] == :without_reception
      options_for_select [
        ['Trámites sin recepcionar', 'without_reception'],
        ['Trámites recepcionados', 'with_reception'],
        ['Trámites sin derivar', 'without_derivation'],
        ['Todos los trámites', 'all_procedures']
      ]
    else
      ## Only reception options.
      options_for_select [
        ['Trámites sin derivar', 'without_derivation'],
        ['Trámites sin recepcionar', 'without_reception'],
        ['Trámites recepcionados', 'with_reception'],
        ['Todos los trámites', 'all_procedures']
      ]
    end
  end

  def select_periods
    ########################
    ## Periods query HERE!!!
    ########################
    options_for_select [
      ['2016 - 2020 (Actual)', 'period_2'],
      ['2012 - 2016', 'period_1']
    ]
  end

  def filter_types
    #####################
    ## Procedures.types HERE!!!
    ####################
    options_for_select [
      ['Despacho de Comisión', 'Despacho'],
      ['Condonación / Eximisión', 'Condonacion'],
      ['Petición Particular', 'Peticion'],
      ['Comunicación Oficial', 'ComunicacionOficial'],
      ['Otros Ingresos', 'Otros']
    ]
  end

  def select_procedure_status
    #####################
    ## HARDCODE HERE!!!
    #####################
    options_for_select [
      ['Seleccione estado', ''],
      [],
      ['Iniciado', 'iniciado'],
      ['Derivado', 'derivado'],
      ['Finalizado', 'finalizado']
    ]
  end
end
