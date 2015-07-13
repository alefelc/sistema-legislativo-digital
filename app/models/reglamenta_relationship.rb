class ReglamentaRelationship < ActiveRecord::Base

  belongs_to :reglamenta, class_name: 'Norma'
  belongs_to :me_reglamenta, class_name: 'Norma'

end
