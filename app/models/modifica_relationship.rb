class ModificaRelationship < ActiveRecord::Base

  belongs_to :modifica, class_name: 'Norma'
  belongs_to :me_modifica, class_name: 'Norma'

end
