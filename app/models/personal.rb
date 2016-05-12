class Personal < ActiveRecord::Base
  ##associations
  has_one :user
  has_many :estado_tramites, as: :ref

  def type
    "Personal"
  end  
end
