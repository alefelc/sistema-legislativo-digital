class OrdenDelDia < ActiveRecord::Base
	belongs_to :sesion
	has_and_belongs_to_many :seccions

	#== asociacion con circuito
	has_many :circuito_ordens
	has_many :circuitos, :through => :circuito_ordens
end
