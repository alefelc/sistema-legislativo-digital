class Destino < ActiveRecord::Base
  # tipo 0: comunicacion, 1: notificacion, 2: publicacion
	belongs_to :norma

end
