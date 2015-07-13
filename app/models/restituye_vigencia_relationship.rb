class RestituyeVigenciaRelationship < ActiveRecord::Base

  belongs_to :restituye, class_name: 'Norma'
  belongs_to :me_restituye, class_name: 'Norma'

end
