class SuspendeVigenciaRelationship < ActiveRecord::Base

  belongs_to :suspende, class_name: 'Norma'
  belongs_to :me_suspende, class_name: 'Norma'

end
