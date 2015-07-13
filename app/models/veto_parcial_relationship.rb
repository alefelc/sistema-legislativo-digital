class VetoParcialRelationship < ActiveRecord::Base

	belongs_to :veta_parcial, class_name: 'Norma'
  belongs_to :me_veta_parcial, class_name: 'Norma'

end
