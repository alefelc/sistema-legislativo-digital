class LegislativeFileService
  def initialize(params, id=nil)
    @params = params
    if id.present?
      @file = LegislativeFile.find_by id: id
    else
      @file = LegislativeFile.new params.slice(:sheets, :topic, :observations, :year, :date, :loops_attributes)
    end
    @loop = @file.loops.build params.slice(:sheets, :topic, :observations, :year, :date, :origin_procedure_id)
    @errors = []
  end

  def save!
    begin
      ActiveRecord::Base.transaction do
        @file.save!
        @loop.save!
        if @loop.origin_procedure.present? && @loop.origin_procedure.topic.blank?
          @loop.origin_procedure.update(topic: @file.topic)
        end
        if @state && @state.fetch(:origin_procedure_id).present?
          @state = @file.legislative_file_states.build procedure: Procedure.find_by(id: @params.fetch(:origin_procedure_id))
          @state.save!
        end
      end
      true
    rescue Exception => e
      false
    end
  end

  def update!
    @file.update @params
  end

  def instance
    @file
  end

  def errors
    errors = []
    errors += @file.errors.full_messages
    errors += @loop.errors.full_messages if @loop.present?
    errors += @state.errors.full_messages if @state.present?
    errors
  end
end
