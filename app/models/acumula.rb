class Acumula < ActiveRecord::Base

  belongs_to :acumulado, class_name: 'Expediente'
	belongs_to :acumula, class_name: 'Expediente'

end
