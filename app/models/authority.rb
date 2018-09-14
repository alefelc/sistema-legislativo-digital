class Authority < ActiveRecord::Base
  belongs_to :person
  belongs_to :periodo

  enum internal_position: [
    :president,
    :first_vicepresident,
    :second_vicepresident,
    :third_vicepresident,
    :prosecutor,
    :secretary
  ]

  validates :periodo, :person, :internal_position, :assumption_date, presence: true

  delegate :full_name, to: :person
end
