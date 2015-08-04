class Destino < ActiveRecord::Base
  # tipo 0: comunicacion 1: notificacion
	belongs_to :norma

end
