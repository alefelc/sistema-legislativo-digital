class ProcedureSignatory < ActiveRecord::Base
  # == Associations
  has_many :processes_signatories
  has_many :procedures, through: :processes_signatories ## Trámites firmados por esta persona

  # == Enums
  enum initiator_type: [:dem, :legislative_secretary, :official_distribution,
    :municipal_office, :particular_legal]

  def text
    "#{name} #{surname} (#{position})"
  end

  def to_s
    "#{surname}, #{name}"
  end

  # Intendente
  def self.mayor
    ProcedureSignatory.find_by default: true
  end
end
