module ProceduresHelper
  ## Missing implementation here!
  ## Dinamically derivate a procedure to its respective area
  def derivated_areas()
    options_for_select([
      ['Dirección Legislativa', 'legislative_area']
    ])
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
    options_for_select(result, procedure)
  end
end
