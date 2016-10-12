class Area < ActiveRecord::Base
  has_many :estado_procedures, as: :ref
  has_and_belongs_to_many :procedures

  def type
    'Area'
  end
end
