class Expediente < ActiveRecord::Base

	#= Associations
	has_many :despachos
	has_many :expediente_administrativos
	has_many :circuitos
	has_many :voz_claves

end
