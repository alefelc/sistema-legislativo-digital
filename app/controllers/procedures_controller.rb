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

  def update
  end

  def show
  end

  private
  def procedure_params
    params.require(:procedure).permit()
  end
end
