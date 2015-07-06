class Tramite < ActiveRecord::Base

	#== Associations
	has_and_belongs_to_many :personas
	has_and_belongs_to_many :bloques
	has_and_belongs_to_many :comisions
  has_many :estado_tramites
  has_one :circuito

end
