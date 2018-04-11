class Loop < ActiveRecord::Base
  # == Associations
  belongs_to :legislative_file
  ##belongs_to :origin_procedure, class_name: 'Procedure', foreign_key: 'origin_procedure_id'
  has_and_belongs_to_many :procedures, join_table: 'legislative_files_procedures', foreign_key: 'legislative_file_id'
  has_and_belongs_to_many :despachos, join_table: 'loops_despachos'
  has_and_belongs_to_many :origin_procedures, join_table: 'loops_procedures', class_name: 'Procedure'

  #== Asociacion con orden del dia
  has_many :loop_ordens
  has_many :orden_del_dias, through: :loop_ordens

  has_and_belongs_to_many :normas
  has_and_belongs_to_many :legislative_file_states

  # == Validations
  # validates :origin_procedure, presence: true, if: :first_loop?

  # == Callbacks
  before_create :set_loop_number

  # == Methods
  def first?
    self.number.zero?
  end

  def nonfirst?
    self.number.nonzero?
  end

  private

  def set_loop_number
    self.number = legislative_file.loops.count
  end

  def first_loop?
    legislative_file.present? && legislative_file.loops.count.zero?
  end
end
