class LegislativeFileService
  def initialize(params)
    @params = params
    puts params.inspect
    @file = LegislativeFile.new params.slice(:sheets, :topic, :observations, :year, :date)
    @loop = @file.loops.build params.slice(:sheets, :topic, :observations, :year, :date, :origin_procedure_id)
    @errors = []
  end

  def save!
    begin
      ActiveRecord::Base.transaction do
        @file.save!
        @loop.save!
        @state = @file.legislative_file_states.build procedure: Procedure.find_by(id: @params.fetch(:origin_procedure_id))
        @state.save!
      end
    rescue Exception => e
      false
    end
  end

  def update!
    true
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
