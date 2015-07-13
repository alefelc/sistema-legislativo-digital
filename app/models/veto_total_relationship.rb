class VetoTotalRelationship < ActiveRecord::Base

	belongs_to :veta_total, class_name: 'Norma'
  belongs_to :me_veta_total, class_name: 'Norma'

end
