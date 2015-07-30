class Expediente < ActiveRecord::Base

	#= Associations
	has_many :despachos
	has_many :expediente_administrativos
	has_many :circuitos
	has_many :tags
	has_many :normas

  #== Shortcut association
  has_many :estado_expedientes, through: :circuitos

	#== Association recursive expediente acumula
  has_many :acumulados_relationship, class_name: "Acumula", foreign_key: "acumula_id"
  has_many :acumulados, through: :acumulados_relationship
  has_one :acumula_relationship, class_name: "Acumula", foreign_key: "acumulado_id"
  has_one :acumula, through: :acumula_relationship

  #== Association recursive expediente acumula
  has_many :adjuntados_relationship, class_name: "AdjuntaFisicamente", foreign_key: "adjunta_id"
  has_many :adjuntados, through: :adjuntados_relationship
  has_one :adjunta_relationship, class_name: "AdjuntaFisicamente", foreign_key: "adjuntado_id"
  has_one :adjunta, through: :adjunta_relationship
end
