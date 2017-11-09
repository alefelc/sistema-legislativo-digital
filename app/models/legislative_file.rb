class LegislativeFile < ActiveRecord::Base
  # == Associations
  has_many :administrative_files
  has_many :loops
  has_many :legislative_file_states, dependent: :delete_all
  has_many :laws
  has_many :tags  ## Change to has_many and add tags model

  # == Association recursive expediente acumula
  has_many :acumulados_relationship, class_name: "Acumula", foreign_key: "acumula_id"
  has_many :accumulated_in, through: :acumulados_relationship
  has_one :acumula_relationship, class_name: "Acumula", foreign_key: "acumulado_id"
  has_one :physically_attached, through: :acumula_relationship

  # == Association recursive expediente acumula
  has_many :adjuntados_relationship, class_name: "AdjuntaFisicamente", foreign_key: "adjunta_id"
  has_many :adjuntados, through: :adjuntados_relationship
  has_one :adjunta_relationship, class_name: "AdjuntaFisicamente", foreign_key: "adjuntado_id"
  has_one :adjunta, through: :adjunta_relationship

  # == Callbacks
  before_create :sequential_number

  # == Nested attributes
  accepts_nested_attributes_for :loops, reject_if: :all_blank

  # == Methods
  # Return first loop. Physical representation of legislative file into DB.
  def first_loop
    return loops.first if loops.count.zero?
    loops.find_by number: 0
  end

  # Return procedure that begins the legislative file.
  def origin_procedure
    loops.find_by(number: 0).try(:origin_procedure)
  end

  def origin_procedure_id
    origin_procedure.try(:id)
  end

  def sequential_number
    return if self.number.present?
    last = LegislativeFile.last
    self.number = (last.number.to_i + 1).to_s if last.present?
  end

  def text
    result = number
    result += " - #{bis}" if bis.present? && !bis.zero?
    result += "[año: #{year}]" if year.present?
    result
  end

  def origin_procedure_id=(proc_id)
    loops.find_by(number: 0).update origin_procedure_id: proc_id
  end
end
