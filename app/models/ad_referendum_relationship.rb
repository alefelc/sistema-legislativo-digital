class AdReferendumRelationship < ActiveRecord::Base

  belongs_to :ad_referendum, class_name: 'Norma'
  belongs_to :tiene_ad_referendum, class_name: 'Norma'

end
