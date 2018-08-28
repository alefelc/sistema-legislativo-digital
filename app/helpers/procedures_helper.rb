module ProceduresHelper
  ## Missing implementation here!
  ## Dinamically derivate a procedure to its respective area
  def derivated_areas()
    options_for_select [
      ['Dirección Legislativa', 'legislative_area']
    ]
  end

  def options_for_procedures
    types = [
      ['Todos los Trámites', 'all_procedures'],
      ['Despachos de Comisión', 'dispatches'],
      ['Condonaciones / Eximisiones', 'condonation'],
      ['Peticiónes Particulares', 'particular_petitions'],
      ['Proyectos', 'projects'],
      ['Comunicaciones Oficiales', 'comunications'],
      ['Otros Trámites', 'others']
    ]

    options_for_select types
  end

  def procedure_types(procedure=nil)
    types = []
    if procedure.present? && procedure != "Despacho"
      types += %w(Condonacion Peticion)
      types += %w(Proyecto ComunicacionOficial OtrosIngresos)
    elsif procedure.present? && procedure == "Despacho"
      types += %w(Despacho)
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
        ['Para recepcionar', 'without_reception'],
        ['Recepcionados', 'with_reception'],
        ['En mesa de entradas', 'without_derivation'],
        ['Todos', 'all_procedures']
      ]
    else
      ## Only reception options.
      options_for_select [
        ['Para derivar', 'without_derivation'],
        ['Sin Recepcionar', 'without_reception'],
        ['Recepcionados', 'with_reception'],
        ['Todos', 'all_procedures']
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
      ['Despachos de Comisión', 'Despacho'],
      ['Proyectos', 'Proyecto'],
      ['Condonaciónes / Eximisiónes', 'Condonacion'],
      ['Peticiones Particulares', 'Peticion'],
      ['Comunicaciónes Oficiales', 'ComunicacionOficial'],
      ['Otros Ingresos', 'OtrosIngresos']
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

  def load_legislative_files(proc)
    options = proc.legislative_files.map { |lf| [lf.text, lf.id] }
    options_for_select options, proc.legislative_file_ids
  end

  def load_comisions(proc)
    options = proc.comisions.map { |c| [c.text, c.id] }
    options_for_select options , proc.comision_ids
  end

  def load_councilors(proc)
    options = proc.persons.map { |c| [c.text, c.id] }
    options_for_select options, proc.person_ids
  end

  def calculate_type(person)
    if (person.type == 'Concejal')
      'councilor'
    elsif (person.type == 'Fisica')
      'particular_pyshic'
    else
      'particular_legal'
    end
  end
end
