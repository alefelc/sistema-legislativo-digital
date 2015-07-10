class Expediente < ActiveRecord::Base

	#= Associations
	has_many :despachos
	has_many :expediente_administrativos
	has_many :circuitos
	has_many :tags
	has_many :normas

	#== Association recursive expediente acumula
  has_many :acumulados, class_name: "Acumula", foreign_key: "acumulado_id"
  has_one :acumula, class_name: "Acumula", foreign_key: "acumula_id"

  #== Association recursive expediente acumula
  has_many :adjuntados, class_name: "AdjuntaFisicamente", foreign_key: "adjuntado_id"
  has_one :adjunta, class_name: "AdjuntaFisicamente", foreign_key: "adjunta_id"
end
