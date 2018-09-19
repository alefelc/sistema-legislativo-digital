module LawsHelper
  def law_types
    types = [:ordenanza, :declaracion, :resolucion]
    types.map { |s| [I18n.t("laws.types.#{s}"), s] }
  end
end
