class AdjuntaFisicamente < ActiveRecord::Base
	belongs_to :adjuntado
	belongs_to :adjunta
end
