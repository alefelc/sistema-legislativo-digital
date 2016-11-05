class ProceduresController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    respond_to do |format|
      format.html
      format.json { render json: ProcedureDatatable.new(view_context) }
    end
  end

  def new
    @procedure = ProcedureForm.new
    #@procedure = Procedure.new
    #@procedure.estado_procedures.build
    #2.times {@procedure.administrative_files.build}
  end

  def create
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
    @procedure = ProcedureForm.new procedure_params
  end

  def update
  end

  def show
    @procedure = Procedure.find params[:id]
  end

  private

  def procedure_params
    params.require(:procedure).permit :type, :sheets, :topic, :observations,
                                      :day, :month, :year, person_ids: [] #legislative_files: [], councilors: [], commissions: [],
  end
end
