class ProceduresController < ApplicationController
  before_action :authenticate_user!

  def index
    respond_to do |format|
      format.html
      format.json { render json: build_json_response }
    end
  end

  def new
    authorize Procedure, :create?

    #@procedure = ProcedureForm.new
    @procedure = Procedure.new
    @procedure.procedure_states.build
    @procedure.administrative_files.build
    @procedure.contingency_plan = ContingencyPlan.new
    @procedure.uploads.build
    #2.times {@procedure.administrative_files.build}
  end

  def create
    authorize Procedure, :create?

    @procedure = Procedure.new procedure_params
    if @procedure.save
      flash[:success] = t '.success'
      redirect_to @procedure
    else
      flash.now[:error] = @procedure.errors.full_messages
      render :new
    end
  end

  def edit
    authorize Procedure, :edit?

    @procedure = Procedure.find params[:id]
    @procedure.contingency_plan = ContingencyPlan.new if @procedure.contingency_plan.nil?
  end

  def update
    authorize Procedure, :edit?
  end

  def show
    @procedure = Procedure.find params[:id]
  end

  def print
    pdf = Prawn::Procedures.new()
    send_data pdf.render, filename: 'tramites.pdf',
              type: 'application/pdf', disposition: 'inline'
  end

  private

  def procedure_params
    params.require(:procedure).permit :type, :sheets, :topic, :observations,
                                      :day, :month, :year, :uploads, :legislative_files,
                                      person_ids: [], comision_ids: [], contingency_plan_attributes: [:date_at, :reason],
                                      procedure_states_attributes: [],
                                      councilors: [], legislative_file_ids: [], administrative_file_ids: [],
                                      administrative_files_attributes: [:id, :number, :sheets, :letter, :year],
                                      procedure_states_attributes: []
  end

  def build_json_response
    if params[:select_q].present?
      q = "%#{params[:select_q]}%"
      w = "id::text ilike ?"
      Procedure.where w, q
    else
      ProcedureDatatable.new(view_context)
    end
  end
end
