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
  has_many :procedure_states
  has_many :administrative_files
  belongs_to :circuito ## Rename it! ## Maybe has_many!?!?!?!!?!?
  has_many :uploads
  has_many :processes_signatories,
           foreign_key: :process_id,
           class_name: 'ProcessesSignatory'
  has_many :signatories,
           through: :processes_signatories,
           class_name: 'Person',
           source: :person
  belongs_to :contingency_plan

  #== Nested attributes
  accepts_nested_attributes_for :uploads, reject_if: :all_blank
  accepts_nested_attributes_for :administrative_files, reject_if: :all_blank
  accepts_nested_attributes_for :procedure_states, reject_if: :all_blank

  # == Callbacks
  after_create :initial_state

  # == PaperTrail changes tracker
  has_paper_trail

  def initiators
    result = persons.collect(&:full_name)
    result += bloques.collect(&:name)
    result += comisions.collect(&:denominacion)
    result += organo_de_gobiernos.collect(&:name)
    result += reparticion_oficials.collect(&:name)
    result += areas.collect(&:name)
    result.flatten.join("; ")
  end

  def legislative_file_ids=(file_ids)
    ## What happened with circuito? why belongs_to relationship?
    file_ids.each do |f|
      circuitos << LegislativeFile.find(f)
    end
  end

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
    self.procedure_states.create nombre: 'Iniciado', tipo: 1
  end
end
