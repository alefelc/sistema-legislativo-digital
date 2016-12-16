class Acumula < ActiveRecord::Base

  belongs_to :acumulado, class_name: 'LegislativeFile'
	belongs_to :acumula, class_name: 'LegislativeFile'

end
