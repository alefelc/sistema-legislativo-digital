class LegislativeFileService
  def initialize(params, id=nil)
    @params = params
    if id.present?
      @file = LegislativeFile.find_by id: id
    else
      @file = LegislativeFile.new params.slice(:sheets, :topic, :observations, :year, :date, :loops_attributes, :uploads)
      @loop = @file.loops.build params.slice(:sheets, :topic, :observations, :year, :date, :origin_procedure_ids)
    end
    @errors = []
  end

  def save!
    begin
      ActiveRecord::Base.transaction do
        @file.save!
        @loop.save!
        if @loop.origin_procedures.present?
          @loop.origin_procedures.each do |proc|
            proc.update(topic: @file.topic) if proc.topic.blank?
          end
        end
        @state = @file.legislative_file_states.build
        @state.save!
      end
      true
    rescue Exception => e
      false
    end
  end

  def update!
    @file.update @params.slice(:sheets, :topic, :observations, :year, :date, :uploads)
    @file.first_loop.update @params.slice(:sheets, :topic, :observations, :year, :date, :origin_procedure_ids)
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
