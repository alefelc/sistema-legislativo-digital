class Area < ActiveRecord::Base
  has_many :estado_tramites, as: :ref
  has_and_belongs_to_many :tramites

  def type
    'Area'
  end
end
