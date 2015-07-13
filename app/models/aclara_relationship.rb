class AclaraRelationship < ActiveRecord::Base

  belongs_to :aclarada, class_name: 'Norma'
  belongs_to :me_aclara, class_name: 'Norma'

end
