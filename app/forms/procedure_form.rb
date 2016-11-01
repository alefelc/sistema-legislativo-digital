class ProcedureForm
  include ActiveModel::Model

  attr_accessor :id
  attr_accessor :sheets, :type, :topic, :observations, :persons,
                :estado_procedures, :councilors, :legislative_files,
                :commissions, :day, :month, :year

  def self.model_name
    ActiveModel::Name.new self, nil, 'Procedure'
  end

  def initialize(params={})
    @procedure = Procedure.new params.slice(:type, :sheets, :topic, :observations)
    @procedure.estado_procedures.build
  end

  def estado_procedures
    @procedure.estado_procedures.build
  end

  def id
    @procedure.id
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
