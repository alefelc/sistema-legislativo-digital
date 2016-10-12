class Procedure < ActiveRecord::Base
	#== Associations
	has_and_belongs_to_many :persons
	has_and_belongs_to_many :bloques
	has_and_belongs_to_many :comisions
  has_and_belongs_to_many :organo_de_gobiernos
  has_and_belongs_to_many :reparticion_oficials
  has_and_belongs_to_many :areas
  has_many :procedures_municipal_offices
  has_many :municipal_offices, through: :municipal_offices_procedures
  has_many :estado_procedures
  has_many :expediente_administrativos
  belongs_to :circuito # I think this is deprecated!!!
  has_many :uploads
  has_many :processes_signatories,
           foreign_key: :process_id,
           class_name: 'ProcessesSignatory'
  has_many :signatories,
           through: :processes_signatories,
           class_name: 'Person',
           source: :person

  #== Nested attributes
  accepts_nested_attributes_for :uploads

  # == Callbacks
  after_create :initial_state

  def to_date date
    date.strftime("%d/%m/%Y") unless date.nil?
  end

  def get_fecha
    to_date(self.fecha).to_s unless self.fecha.nil?
  end

  def get_fojas
    self.nro_fojas.to_s
  end

  def get_asunto
    self.asunto.to_s
  end

  def get_date_time
    self.updated_at
  end

  def get_observaciones
    self.observaciones
  end

  def get_iniciadores
    self.bloques.map{ |x| {type: "Bloque", denominacion: x.denominacion } }.to_a + self.comisions.map{ |x| {type: "Comision", denominacion: x.denominacion } }.to_a + self.reparticion_oficials.map{ |x| {type: "ReparticionOficial", denominacion: x.denominacion } }.to_a + self.municipal_offices.map{ |x| {type: "Dependencia Municipal", denominacion: x.denominacion } }.to_a + self.organo_de_gobiernos.map{ |x| {type: "OrganoDeGobierno", denominacion: x.denominacion, codigo: x.codigo } }.to_a + self.areas.map{ |x| {type: "Area", denominacion: x.denominacion, codigo: x.codigo } }.to_a + self.persons.map{ |x| {type: x.type, apellido: x.apellido, nombre: x.nombre, bloque: x.try(:bloque).try(:denominacion) } }.to_a
  end

  private

  def initial_state
    self.estado_procedures.create nombre: 'Iniciado', tipo: 1
  end
end
