class LegislativeFileState < ActiveRecord::Base
  # == Associations
	belongs_to :legislative_file
  belongs_to :procedure
  belongs_to :loop
  belongs_to :legislative_session
  has_and_belongs_to_many :loops
  has_and_belongs_to_many :comisions
  has_and_belongs_to_many :laws

  # == Validations
  validates :legislative_file_id, presence: true
  #### :procedure only if was initiated or dispatched.

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
