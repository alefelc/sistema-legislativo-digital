class ReparticionOficial < ActiveRecord::Base
  # == Associations
  has_and_belongs_to_many :procedures

  # == Validations
  validates :denominacion, presence: true

  def type
    'ReparticionOficial'
  end

  def text
  	denominacion
  end
end
