class PromulgaRelationship < ActiveRecord::Base

  belongs_to :promulga, class_name: 'Norma'
  belongs_to :me_promulga, class_name: 'Norma'

end
