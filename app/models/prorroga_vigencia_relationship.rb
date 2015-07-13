class ProrrogaVigenciaRelationship < ActiveRecord::Base

  belongs_to :prorroga, class_name: 'Norma'
  belongs_to :me_prorroga, class_name: 'Norma'

end
