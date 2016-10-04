module ProceduresHelper
  def procedure_types
    types = %w(commission_dispatch condonation particular_request)
    types += %w(project official_communication)
    result = [[]]
    types.each do |t|
      result << [I18n.t("procedures.types.#{t}"), t]
    end
    options_for_select(result)
  end
end
