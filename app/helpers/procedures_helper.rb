module ProceduresHelper
  def procedure_types
    types = %w(Despacho Condonacion Peticion)
    types += %w(Proyecto ComunicacionOficial)
    result = [[]]
    types.each do |t|
      result << [I18n.t("procedures.types.#{t}"), t]
    end
    options_for_select(result)
  end
end
