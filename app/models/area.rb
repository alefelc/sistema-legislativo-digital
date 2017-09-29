class Area < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :procedure_derivation

  def to_s
  	name
  end
end
