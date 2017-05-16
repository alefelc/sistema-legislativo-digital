module ProceduresHelper
  def procedure_types(procedure=nil)
    types = %w(Despacho Condonacion Peticion)
    types += %w(Proyecto ComunicacionOficial OtrosIngresos)
    result = [[]]
    types.each do |t|
      result << [I18n.t("procedures.types.#{t}"), t]
    end
    options_for_select(result, procedure)
  end
end
