class Procedure < ActiveRecord::Base

  ####### Remove it after rename "type" column to "procedure_type" #######
  # disable STI to allow columns named "type"
  self.inheritance_column = :_type_disabled

	#== Associations
	has_and_belongs_to_many :persons
	has_and_belongs_to_many :bloques
	has_and_belongs_to_many :comisions
  has_and_belongs_to_many :organo_de_gobiernos
  has_and_belongs_to_many :reparticion_oficials
  has_and_belongs_to_many :areas
  has_and_belongs_to_many :municipal_offices, through: :municipal_offices_procedures
  has_and_belongs_to_many :legislative_files

  has_many :procedure_states
  has_many :administrative_files
  has_many :uploads
  has_many :processes_signatories,
           foreign_key: :process_id,
           class_name: 'ProcessesSignatory'
  has_many :signatories,
           through: :processes_signatories,
           class_name: 'Person',
           source: :person
  belongs_to :contingency_plan
  has_many :procedure_signatories

  has_one :procedure_derivation

  #== Nested attributes
  accepts_nested_attributes_for :uploads, reject_if: :all_blank
  accepts_nested_attributes_for :administrative_files, reject_if: :all_blank
  accepts_nested_attributes_for :procedure_states, reject_if: :all_blank
  accepts_nested_attributes_for :contingency_plan, reject_if: :all_blank
  accepts_nested_attributes_for :procedure_signatories, reject_if: :all_blank

  #== Callbacks
  after_create :initial_state

  #== PaperTrail changes tracker
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

  def to_date(date)
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

  private

  def initial_state
    self.procedure_states.create nombre: 'Iniciado', tipo: 1
  end

  def is_dispatch?
    type == "Despacho"
  end

  def isnt_dispatch?
    !is_dispatch?
  end
end
