class AdjuntaFisicamente < ActiveRecord::Base

  belongs_to :adjuntado, class_name: 'LegislativeFile'
	belongs_to :adjunta, class_name: 'LegislativeFile'

end
