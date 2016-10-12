class ProcedureForm
  include ActiveModel::Model

  attr_accessor :id
  attr_accessor :sheets, :type, :topic, :observations, :persons

  def self.model_name
    ActiveModel::Name.new self, nil, 'Procedure'
  end

  def initialize(params={})
    @procedure = Procedure.new params.slice(:type, :sheets, :topic, :observations)
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
