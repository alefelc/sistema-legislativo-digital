class ReparticionOficial < ActiveRecord::Base
  # == Associations
  has_and_belongs_to_many :procedures

  # == Validations
  validates :denominacion, presence: true

  def type
    'ReparticionOficial'
  end
end
