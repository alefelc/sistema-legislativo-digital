class ProceduresController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json { render json: ProcedureDatatable.new(view_context) }
    end
  end

  def new
    @procedure = Tramite.new
  end

  def create
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
