class LegislativeFileState < ActiveRecord::Base
  # == Associations
	belongs_to :legislative_file
  belongs_to :procedure
  belongs_to :loop
  has_and_belongs_to_many :loops
  has_and_belongs_to_many :comisions

  # == Validations
  validates :legislative_file, :procedure, presence: true

  # == Callbacks
  before_save :default_date_at

  # == Enums
  enum name: [:initialized, :in_comision, :dispatched, :sanctioned,
    :day_plan, :retired]
  enum state_type: [:administrative, :parliamentary, :comision]

  private

  def default_date_at
    self.date_at = Date.current unless date_at
  end
end
