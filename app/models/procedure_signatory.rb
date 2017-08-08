class ProcedureSignatory < ActiveRecord::Base
  # == Associations
  has_many :processes_signatories
  has_many :procedures, through: :processes_signatories ## Trámites firmados por esta persona

  # == Enums
  enum initiator_type: [:dem, :legislative_secretary, :official_distribution,
    :municipal_office, :particular_legal]

  def text
    "#{surname}, #{name} (#{position})"
  end
end
