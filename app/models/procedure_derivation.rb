class ProcedureDerivation < ActiveRecord::Base
  # == Associations
  belongs_to :procedure
  belongs_to :area
  belongs_to :derived_by, class_name: "User", foreign_key: :derived_by
  belongs_to :received_by, class_name: "User", foreign_key: :received_by

  # == Validations
  validates :procedure_id, :area, :derived_by, :derived_at, presence: true

  # == Callbacks
  after_save :update_procedure

  private

  def update_procedure
    proc = Procedure.find self.procedure_id
    proc.update procedure_derivation_id: self.id
  end
end
