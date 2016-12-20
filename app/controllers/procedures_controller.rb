class ProceduresController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    respond_to do |format|
      format.html
      format.json { render json: ProcedureDatatable.new(view_context) }
    end
  end

  def new
    authorize Procedure, :create?

    #@procedure = ProcedureForm.new
    @procedure = Procedure.new
    @procedure.procedure_states.build
    @procedure.administrative_files.build
    @procedure.uploads.build
    #2.times {@procedure.administrative_files.build}
  end

  def create
    authorize Procedure, :create?

    @procedure = ProcedureForm.new procedure_params
    if @procedure.save
      flash[:success] = t '.success'
      redirect_to procedure_path(@procedure.id)
    else
      flash.now[:error] = @procedure.errors.full_messages
      render :new
    end
  end

  def edit
    authorize Procedure, :edit?

    @procedure = ProcedureForm.new procedure_params
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
                                      :day, :month, :year, :uploads, person_ids: [],
                                      administrative_files_attributes: [:id,
                                        :number, :sheets, :letter, :year] #legislative_files: [], councilors: [], commissions: [],
  end
end
