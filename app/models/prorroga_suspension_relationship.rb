class ProrrogaSuspensionRelationship < ActiveRecord::Base

  belongs_to :suspendida, class_name: 'Norma'
  belongs_to :me_suspende, class_name: 'Norma'

end
