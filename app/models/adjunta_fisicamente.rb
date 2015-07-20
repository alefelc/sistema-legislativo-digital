class AdjuntaFisicamente < ActiveRecord::Base

  belongs_to :adjuntado, class_name: "Expediente"
	belongs_to :adjunta, class_name: "Expediente"

end
