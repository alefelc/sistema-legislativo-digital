class Periodo < ActiveRecord::Base

  #== Associations
  has_and_belongs_to_many :bloques
	has_and_belongs_to_many :comisions
  has_and_belongs_to_many :personas

end
