class ProcedureForm
  include ActiveModel::Model

  def self.model_name
    ActiveModel::Name.new self, nil, 'Procedure'
  end

  def initialize(params={})
    @procedure = Procedure.new params.dup.slice(:type, :sheets, :topic, :observations, :person_ids, :administrative_files_attributes)
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
