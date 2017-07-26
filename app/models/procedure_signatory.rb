class ProcedureSignatory < ActiveRecord::Base
  # == Associations
  belongs_to :procedure

  # == Enums
  enum initiator_type: [:dem, :legislative_secretary, :official_distribution,
    :municipal_office, :particular_legal]

  def text
    "#{surname}, #{name} (#{position})"
  end
end
