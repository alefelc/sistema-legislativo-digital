class ProcedureDerivation < ActiveRecord::Base
  belongs_to :procedure
  belongs_to :area
  belongs_to :derived_by, class_name: "User", foreign_key: :derived_by
  belongs_to :received_by, class_name: "User", foreign_key: :received_by

  validates :procedure_id, :area, :derived_by, :derived_at, presence: true
end
