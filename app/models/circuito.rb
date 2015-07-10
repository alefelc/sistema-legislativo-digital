class Circuito < ActiveRecord::Base

  # == Associations
	belongs_to :expediente
	has_many :estado_expedientes
	belongs_to :tramite

	#== asociacion con orden del dia
	has_many :circuito_ordens
	has_many :orden_del_dias, :through => :circuito_ordens

  has_and_belongs_to_many :normas

end
