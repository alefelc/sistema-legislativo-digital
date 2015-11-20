class Expediente < ActiveRecord::Base

	#= Associations
	has_and_belongs_to_many :despachos, join_table: 'expedientes_despachos'
	has_many :expediente_administrativos
	has_many :circuitos
	has_and_belongs_to_many :tags
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

  def get_anio_expediente
    if self.anio.present?
      " Año " + self.anio.year.to_s
    else
      " - Año no asignado"
    end
  end

  def get_fojas
    self.nro_fojas.to_s
  end

  def get_exps_adm
    self.expediente_administrativos
  end

  def get_circuitos
    self.circuitos.where.not(nro:0).order(nro: :asc)
  end  

  def get_despachos
    self.despachos
  end

  def to_date date
    date.strftime("%d/%m/%Y") unless date.nil?
  end

  def get_anio
    to_date(self.anio).to_s unless self.anio.nil?
  end

  def get_observaciones
    self.observacion
  end

  before_create :put_expediente_number

  def put_expediente_number
    self.nro_exp = (Expediente.last.nro_exp.to_i + 1).to_s
  end
end
