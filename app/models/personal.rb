class Personal < ActiveRecord::Base
  ##associations
  has_one :usuario
  has_many :estado_tramites, as: :ref

  def type
    "Personal"
  end  
end
