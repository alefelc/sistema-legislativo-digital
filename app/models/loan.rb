class Loan < ActiveRecord::Base
  # == ASSOCIATIONS
  belongs_to :legislative_file
  belongs_to :person

  # == NESTED ATTRIBUTES
  accepts_nested_attributes_for :person

  # == VALIDATIONS
  validates :legislative_file_id, presence: true
  validates :person_id, presence: true
  validates :borrowed_at, presence: true

  # == SCOPES
  scope :pendant_files, -> { where(returned_at: nil) }
end
