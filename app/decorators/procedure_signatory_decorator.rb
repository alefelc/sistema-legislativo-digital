class ProcedureSignatoryDecorator < Draper::Decorator
  delegate_all

  def signator_types
    types = lambda { |type| [h.t("signatories.initiator_types.#{type}"), type] }
    signatory_types = ProcedureSignatory.initiator_types.keys.map(&types)
    h.options_for_select(signatory_types, object.initiator_type)
  end

  def leave_date
    object.leave_date.try :to_default_s
  end
end
