module LawsHelper
  def law_types
    Law.law_types.keys.map do |s|
      [I18n.t("laws.types.#{s}"), s]
    end
  end
end
