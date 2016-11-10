class ProcedureForm
  include ActiveModel::Model

  attr_accessor :id
  attr_accessor :sheets, :type, :topic, :observations, :person_ids,
                :estado_procedures, :councilors, :legislative_files,
                :commissions, :day, :month, :year, :administrative_files

  def self.model_name
    ActiveModel::Name.new self, nil, 'Procedure'
  end

  def initialize(params={})
    @procedure = Procedure.new params.dup.slice(:type, :sheets, :topic, :observations, :person_ids)
    #@procedure.estado_procedures.build nombre: '', especificacion: ''
    @procedure.estado_procedures.build
    @estado_procedures = @procedure.estado_procedures
    @procedure.administrative_files.build
    @administrative_files = @procedure.administrative_files
  end

  def id
    @procedure.id
  end

  def estado_procedures
    @procedure.estado_procedures
  end

  def administrative_files
    @procedure.administrative_files
  end

  def save
    ActiveRecord::Base.transaction do
      @procedure.save
      true
    end
  rescue ActiveRecord::RecordInvalid
    false
  end
end
