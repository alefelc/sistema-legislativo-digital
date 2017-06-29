class Acumula < ActiveRecord::Base

  belongs_to :accumulated_in, class_name: 'LegislativeFile'
	belongs_to :physically_attached, class_name: 'LegislativeFile'

end
