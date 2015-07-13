class DelegaRelationship < ActiveRecord::Base

  belongs_to :delega, class_name: 'Norma'
  belongs_to :me_delega, class_name: 'Norma'

end
