class Circuito < ActiveRecord::Base

	belongs_to :expediente
	has_many :estado_expedientes
	belongs_to :tramite

end
