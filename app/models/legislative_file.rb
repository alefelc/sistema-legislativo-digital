class LegislativeFile < ActiveRecord::Base

  #= Associations
  has_many :administrative_files
  has_many :loops
  has_and_belongs_to_many :tags
  has_many :normas

  #== polymorfic association
  has_many :estado_procedures, as: :ref

  #== Shortcut association
  has_many :legislative_file_states, through: :loops

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

  #== Callbacks
  before_create :put_expediente_number
  after_create :zero_loop_by_default
  before_create :set_bis

  #== Nested attributes
  accepts_nested_attributes_for :loops
  accepts_nested_attributes_for :legislative_file_states, reject_if: :all_blank, allow_destroy: true

  def last_loop
    loops.order(:nro).last
  end

  def set_bis
    bis = 0
  end

  def put_expediente_number
    last = LegislativeFile.last
    self.nro_exp = (last.nro_exp.to_i + 1).to_s if last.present?
  end

  def zero_loop_by_default
    loop = Loop.create nro: 0, legislative_file: self
    loop.legislative_file_states.create nombre: "Iniciado", tipo: 1, fecha: self.anio
  end

  def get_anio_expediente
    self.anio.present? ? " Año " + self.anio.year.to_s : " - Año no asignado"
  end

  def get_fojas
    self.nro_fojas.to_s
  end

  def get_exps_adm
    self.administrative_files
  end

  def get_despachos
    #self.despachos
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

  def type
    "LegislativeFile"
  end

  def text
    result = nro_exp
    result += " - #{bis}" if bis.present? && !bis.zero?
    result += "[año: #{year}]" if anio.present?
    result
  end

  def to_s
    text
  end
end
