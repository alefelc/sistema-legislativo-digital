class DerogaRelationship < ActiveRecord::Base

  belongs_to :derogada, class_name: 'Norma'
  belongs_to :me_deroga, class_name: 'Norma'

end
