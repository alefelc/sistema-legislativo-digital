class ProcedureDerivation < ActiveRecord::Base
  belongs_to :procedure
  belongs_to :area
  belongs_to :derived_by, class_name: "User", foreign_key: :derived_at
  belongs_to :received_by, class_name: "User", foreign_key: :received_by
end
